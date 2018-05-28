//
//  Simulators.swift
//  Simulators
//
//  Created by Kazuya Ueoka on 2018/05/24.
//

import Foundation

public class Simulators {
    public struct Device: Equatable {
        public let name: String
        public let udid: String
        
        public init(name: String, udid: String) {
            self.name = name
            self.udid = udid
        }
    }
    
    public static func findDevice(for osType: String, withOSVersion osVersion: [String], andDevices devices: [String]) -> [Device] {
        guard let json = Command.run("xcrun", arguments: ["simctl", "list", "--json"]), let data = json.data(using: .utf8) else {
            print("xcrun simctl list --json get failed")
            exit(1)
        }
        
        guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {
            print("json parse failed")
            exit(1)
        }
        
        return osVersion.reduce(into: []) { (result, currentOS) in
            result += self.devices(withOS: osType, andVersion: currentOS, from: jsonDictionary, andTarget: devices)
        }
    }
    
    public static func devices(withOS osType: String, andVersion version: String, from jsonDictionary: [String: Any], andTarget devices: [String]) -> [Device] {
        guard let deviceList = jsonDictionary["devices"] as? [String: Any] else { return [] }
        
        var result: [Device] = []
        
        let keys: [String] = [
            String(format: "%@ %@", osType, version),
            String(format: "com.apple.CoreSimulator.SimRuntime.%@-%@", osType, version.replacingOccurrences(of: ".", with: "-"))
        ]
        
        keys.forEach { (key) in
            guard let targetDevicces = deviceList[key] as? [[String: String]] else { return }
            
            targetDevicces.forEach({ (currentDevice) in
                guard let name = currentDevice["name"], let udid = currentDevice["udid"] else { return }
                if devices.contains(name) {
                    let device = Device(name: name, udid: udid)
                    result.append(device)
                }
            })
        }
        
        return result
    }
    
    public static func isBooted(udid: String) -> Bool {
        let booted = Command.run("xcrun", arguments: [
            "simctl",
            "list"
            ])?.components(separatedBy: "\n").filter({ (line) -> Bool in
                return line.contains(udid) && line.contains("Booted")
            }) ?? []
        return 0 < booted.count
    }
    
    public static func boot(_ device: Device) {
        Command.run("xcrun", arguments: [
            "simctl",
            "boot",
            device.udid
            ])
    }
    
    public static func install(to device: Device, with appPath: String) {
        Command.run("xcrun", arguments: [
            "simctl",
            "install",
            device.udid,
            appPath
            ])
    }
    
    public static func launch(on device: Device, with bundleIdentifier: String) {
        Command.run("xcrun", arguments: [
            "simctl",
            "launch",
            device.udid,
            bundleIdentifier
            ])
    }
}
