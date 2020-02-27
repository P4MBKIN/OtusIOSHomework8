//
//  Extensions.swift
//  HomeWork8
//
//  Created by Pavel Antonov on 25.02.2020.
//  Copyright © 2020 OtusCourse. All rights reserved.
//

import Foundation

public enum Regexes: String {
    case date = #"(-?(?:[1-9][0-9]*)?[0-9]{4})-(1[0-2]|0[1-9])-(3[01]|0[1-9]|[12][0-9])T(2[0-3]|[01][0-9]):([0-5][0-9]):([0-5][0-9])(\\.[0-9]+)?"#
}

public extension String {
    
    func isContain(regex: Regexes) -> Bool {
        guard !self.isEmpty else { return false }
        do {
            let regex = try NSRegularExpression(pattern: regex.rawValue)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return !results.isEmpty
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return false
        }
    }
    
    func parseData(regex: Regexes) -> [String] {
        guard !self.isEmpty else { return [] }
        do {
            let regex = try NSRegularExpression(pattern: regex.rawValue)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
