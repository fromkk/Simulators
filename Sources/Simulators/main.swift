import Cocoa
import SimulatorsCore

func showHelp() {
    let help: String = """
    Usage: simulators [--project <project>] | [--workspace <workspace>] --scheme <scheme> --bundleIdentifier <bundleIdentifier> --beforeClean <beforeClean> --devices <devices> --osVersion <osVersion> --showBuildLog <showBuildLog>
    
    Options:
    --project          set XXX.xcodeproj path
    --workspace        set XXX.xcworkspace path
    --scheme           set build scheme
    --bundleIdentifier set bundleIdentifier
    --beforeClean      set if clean before build [true|false]
    --devices          set devices [iPhone SE,iPhone 7,iPhone 7 Plus,iPhone X,etc...]
    --osVersion        set OS versions [10.3,11.3,etc...]
    --showBuildLog     set if show build log [true|false]
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
let showBuildLog = (arguments["showBuildLog"] ?? "false") == "true"

guard let scheme = arguments["scheme"] else {
    print("scheme not founnd")
    showHelp()
    exit(1)
}

if beforeClean {
    Xcodebuild.clean()
}

let buildLog = Xcodebuild.build(withProject: project, orWorkspace: workspace, andScheme: scheme)

if showBuildLog {
    print(buildLog)
}

let codeSigningFolderPath = Xcodebuild.codeSigningFolderPath(for: buildLog)
let bundleIdentifier = arguments["bundleIdentifier"] ?? Xcodebuild.bundleIdentifier(for: buildLog)

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
        
        print("Waiting for device", device)
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 5.0))
        process(with: device)
    }
}

findDevices.forEach { (device) in
    process(with: device)
}

print("Done!")
exit(0)
