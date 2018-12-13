//
//  Simulators.swift
//  Simulators
//
//  Created by Kazuya Ueoka on 2018/05/24.
//

import Foundation

public class Simulators {
    public struct Device: Equatable {
        public enum Availability: String {
            case available
            case unavailable
            case runtimeProfileNotFound = "runtime profile not found"
        }
        
        public enum State: String {
            case booted = "Booted"
            case shutdown = "Shutdown"
        }
        
        public let name: String
        public let udid: String
        public let availability: [Availability]
        public let state: State
        
        public init(name: String, udid: String, availability: [Availability], state: State) {
            self.name = name
            self.udid = udid
            self.availability = availability
            self.state = state
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
            guard let targetDevices = deviceList[key] as? [[String: Any]] else {
                debugPrint("targetDevices not found")
                return
            }
            
            targetDevices.forEach({ (currentDevice) in
                guard let name = currentDevice["name"] as? String, let udid = currentDevice["udid"] as? String, let availabilityString = currentDevice["availability"] as? String, let stateString = currentDevice["state"] as? String, let state = Device.State(rawValue: stateString) else { return }
                if devices.contains(name) {
                    let availabilities = availabilityString.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").components(separatedBy: ",")
                    let availavility: [Device.Availability] = availabilities.compactMap { current in
                        return Device.Availability(rawValue: current.trimmingCharacters(in: .whitespacesAndNewlines))
                    }
                    
                    let device = Device(name: name, udid: udid, availability: availavility, state: state)
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
    
    public static func launch(on device: Device, with bundleIdentifier: String, language: String?, locale: String?) {
        var arguments: [String] = [
            "simctl",
            "launch",
            device.udid,
            bundleIdentifier
        ]
        if let language = language {
            arguments.append(contentsOf: ["-AppleLanguages", "(\(language))"])
        }
        
        if let locale = locale {
            arguments.append(contentsOf: ["-AppleLocale", locale])
        }
        debugPrint(#function, "arguments", arguments)
        Command.run("xcrun", arguments: arguments)
    }
}
