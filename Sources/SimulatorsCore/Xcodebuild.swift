//
//  Xcodebuild.swift
//  Simulators
//
//  Created by Kazuya Ueoka on 2018/05/24.
//

import Foundation

public class Xcodebuild {
    public static func clean() {
        Command.run("xcodebuild", arguments: ["clean"])
    }
    
    public static func build(withProject project: String?, orWorkspace workspace: String?, andScheme scheme: String) -> String {
        let result: String?
        if let project = project {
            result = Command.run("xcodebuild", arguments: [
                "build",
                "-project",
                project,
                "-scheme",
                scheme,
                "-configuration",
                "Debug",
                "-sdk",
                "iphonesimulator"
                ])
        } else if let workspace = workspace {
            result = Command.run("xcodebuild", arguments: [
                "build",
                "-workspace",
                workspace,
                "-scheme",
                scheme,
                "-configuration",
                "Debug",
                "-sdk",
                "iphonesimulator"
                ])
        } else {
            print("project or workspace is required")
            exit(1)
        }
        
        guard let buildResult = result else {
            print("buildResult can't get")
            exit(1)
        }
        
        return buildResult
    }
    
    private static func findResult(from regexMatched: [[String]]) -> String? {
        guard let first = regexMatched.first else { return nil }
        guard first.indices.contains(1) else { return nil }
        return first[1]
    }
    
    public static func codeSigningFolderPath(for buildResult: String) -> String {
        if let path = findResult(from: buildResult.regexStrings(with: "/usr/bin/codesign.+--timestamp=none (.*?\\.app)\n")) {
            return path
        } else if let path = findResult(from: buildResult.regexStrings(with: "export CODESIGNING_FOLDER_PATH=(.*?\\.app)\n")) {
            return path
        } else {
            print("CODESIGNING_FOLDER_PATH get failed")
            exit(1)
        }
    }
    
    public static func bundleIdentifier(for buildResult: String) -> String {
        if let bundleIdentifier = findResult(from: buildResult.regexStrings(with: "export PRODUCT_BUNDLE_IDENTIFIER=(.*?)\n")) {
            return bundleIdentifier
        } else if let bundleIdentifier = findResult(from: buildResult.regexStrings(with: "\"application-identifier\" = \"[A-Z0-9]+\\.(.+)\";")) {
            return bundleIdentifier
        } else {
            print("PRODUCT_BUNDLE_IDENTIFIER get failed")
            exit(1)
        }
    }
}
