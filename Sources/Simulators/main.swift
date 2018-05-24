import Cocoa

func showHelp() {
    let help: String = """
    Usage: simulators [--project <project>] | [--workspace <workspace>] --scheme <scheme> --bundleIdentifier <bundleIdentifier> --beforeClean <beforeClean> --devices <devices> --osVersion <osVersion>
    
    Options:
    --project          set XXX.xcodeproj path
    --workspace        set XXX.xcworkspace path
    --scheme           set build scheme
    --bundleIdentifier set bundleIdentifier
    --beforeClean      set if clean before build [true|false]
    --devices          set devices [iPhone SE,iPhone 7,iPhone 7 Plus,iPhone X,etc...]
    --osVersion        set OS versions [10.3,11.3,etc...]
    """
    print(help)
}

let arguments = Arguments(arguments: CommandLine.arguments).parse()

if let _ = arguments["help"] {
    showHelp()
    exit(0)
}

let project = arguments["project"]
let workspace = arguments["workspace"]

let beforeClean = (arguments["beforeClean"] ?? "false") == "true"
let devices: [String] = (arguments["devices"] ?? "iPhone SE,iPhone 7,iPhone 7 Plus,iPhone X").components(separatedBy: ",")
let osVersion: [String] = (arguments["osVersion"] ?? "10.3,11.3").components(separatedBy: ",")
let osType: String = "iOS"

guard let scheme = arguments["scheme"] else {
    print("scheme not founnd")
    showHelp()
    exit(1)
}

if beforeClean {
    Xcodebuild.clean()
}

let buildResult = Xcodebuild.build(withProject: project, orWorkspace: workspace, andScheme: scheme)
let codeSigningFolderPath = Xcodebuild.codeSigningFolderPath(for: buildResult)
let bundleIdentifier = arguments["bundleIdentifier"] ?? Xcodebuild.buildIdentifier(for: buildResult)

let findDevices = Simulators.findDevice(for: osType, withOSVersion: osVersion, andDevices: devices)
guard 0 < findDevices.count else {
    print("devices not found")
    showHelp()
    exit(1)
}

func process(with device: Simulators.Device) {
    if Simulators.isBooted(udid: device.udid) {
        print("install \(codeSigningFolderPath) to \(device.udid)")
        Simulators.install(to: device, with: codeSigningFolderPath)
        print("launch \(bundleIdentifier) to \(device.udid)")
        Simulators.launch(on: device, with: bundleIdentifier)
    } else {
        Command.run("open", arguments: [
            "-a",
            "Simulator.app",
            "--args",
            device.udid
            ])
        
        print("boot \(device.udid)")
        Simulators.boot(device)
        
        if #available(OSX 10.12, *) {
            print("Waiting for device", device)
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 5.0))
            process(with: device)
        }
    }
}

findDevices.forEach { (device) in
    process(with: device)
}

print("Done!")
exit(0)
