import SimulatorsCore
import XCTest

class XcodebuildTest: XCTestCase {
    
    let log1: String = """
Entitlements:

{
"application-identifier" = "HOGE1234HOGE.me.fromkk.Simulators";
}

Signing Identity:     "-"

/usr/bin/codesign --force --sign - --entitlements /Users/fromkk/Library/Developer/Xcode/DerivedData/Simulators-hogehogehogehogehogehogehogehoge/Build/Intermediates.noindex/Simulators.build/Debug-iphonesimulator/Simulators.build/Simulators.app.xcent --timestamp=none /Users/fromkk/Library/Developer/Xcode/DerivedData/Simulators-hogehogehogehogehogehogehogehoge/Build/Products/Debug-iphonesimulator/Simulators.app

"""
    
    let log2: String = """
export PRODUCT_BUNDLE_IDENTIFIER=me.fromkk.Simulators
export CODESIGNING_FOLDER_PATH=/Users/fromkk/Library/Developer/Xcode/DerivedData/Simulators-hogehogehogehogehogehogehogehoge/Build/Products/Debug-iphonesimulator/Simulators.app

"""
    
    func testCodeSigninFolderPath() {
        XCTAssertEqual(Xcodebuild.codeSigningFolderPath(for: log1), "/Users/fromkk/Library/Developer/Xcode/DerivedData/Simulators-hogehogehogehogehogehogehogehoge/Build/Products/Debug-iphonesimulator/Simulators.app")
        XCTAssertEqual(Xcodebuild.codeSigningFolderPath(for: log2), "/Users/fromkk/Library/Developer/Xcode/DerivedData/Simulators-hogehogehogehogehogehogehogehoge/Build/Products/Debug-iphonesimulator/Simulators.app")
    }
    
    func testBundleIdentifier() {
        XCTAssertEqual(Xcodebuild.bundleIdentifier(for: log1), "me.fromkk.Simulators")
        XCTAssertEqual(Xcodebuild.bundleIdentifier(for: log2), "me.fromkk.Simulators")
    }
    
}
