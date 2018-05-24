//
//  Xcodebuild.swift
//  Simulators
//
//  Created by Kazuya Ueoka on 2018/05/24.
//

import Foundation

class Xcodebuild {
    static func clean() {
        Command.run("xcodebuild", arguments: ["clean"])
    }
    
    static func build(withProject project: String?, orWorkspace workspace: String?, andScheme scheme: String) -> String {
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
    
    static func codeSigningFolderPath(for buildResult: String) -> String {
        let paths = buildResult.regexStrings(with: "export CODESIGNING_FOLDER_PATH=(.*?\\.app)\n")
        guard let first = paths.first else {
            print("CODESIGNING_FOLDER_PATH get failed")
            exit(1)
        }
        
        guard first.indices.contains(1) else {
            print("CODESIGNING_FOLDER_PATH get failed")
            exit(1)
        }
        
        return first[1]
    }
    
    static func buildIdentifier(for buildResult: String) -> String {
        let paths = buildResult.regexStrings(with: "export PRODUCT_BUNDLE_IDENTIFIER=(.*?)\n")
        guard let first = paths.first else {
            print("PRODUCT_BUNDLE_IDENTIFIER get failed")
            exit(1)
        }
        
        guard first.indices.contains(1) else {
            print("PRODUCT_BUNDLE_IDENTIFIER get failed")
            exit(1)
        }
        
        return first[1]
    }
}
