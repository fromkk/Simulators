//
//  String+Regexp.swift
//  Simulators
//
//  Created by Kazuya Ueoka on 2018/05/24.
//

import Foundation

// MARK: - Regular Expression
private extension String {
    func regexp(_ pattern: String) -> NSRegularExpression {
        do {
            let regexp: NSRegularExpression = try NSRegularExpression(pattern: pattern, options: [NSRegularExpression.Options.caseInsensitive])
            return regexp
        } catch {
            fatalError("regular expression pattern is invalid.")
        }
    }
}

// MARK: - Regular Expression
extension String {
    func regexMatched(withPattern pattern: String) -> Bool {
        let regexp: NSRegularExpression = self.regexp(pattern)
        return 0 < regexp.numberOfMatches(in: self, options: [], range: NSRange(location: 0, length: (self as NSString).length))
    }
    
    func regexStrings(with pattern: String) -> [[String]] {
        guard !self.isEmpty else { return [] }
        let regex: NSRegularExpression = self.regexp(pattern)
        return regex.matches(in: self, options: [], range: (self as NSString).range(of: self)).map { (checkingResult: NSTextCheckingResult) -> [String] in
            return (0..<checkingResult.numberOfRanges).compactMap({ (i: Int) -> String? in
                guard checkingResult.range(at: i).location != NSNotFound else { return nil }
                return (self as NSString).substring(with: checkingResult.range(at: i))
            })
        }
    }
    
    func regexReplace(withPattern pattern: String, replace: String) -> String {
        let regexp: NSRegularExpression = self.regexp(pattern)
        let matches: [NSTextCheckingResult] = regexp.matches(in: self, options: [], range: NSRange(location: 0, length: (self as NSString).length))
        var result: String = self
        matches.reversed().forEach { (match: NSTextCheckingResult) in
            result = (result as NSString).replacingCharacters(in: match.range, with: replace)
        }
        return result
    }
}
