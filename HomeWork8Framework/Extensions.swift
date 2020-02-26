//
//  Extensions.swift
//  HomeWork8
//
//  Created by Pavel Antonov on 25.02.2020.
//  Copyright © 2020 OtusCourse. All rights reserved.
//

import Foundation

public extension String {
    
    func isContainDate() -> Bool {
        guard !self.isEmpty else { return false }
        let dateRegex = #"(-?(?:[1-9][0-9]*)?[0-9]{4})-(1[0-2]|0[1-9])-(3[01]|0[1-9]|[12][0-9])T(2[0-3]|[01][0-9]):([0-5][0-9]):([0-5][0-9])(\\.[0-9]+)?"#
        return NSPredicate(format: "SELF MATCHES %@", dateRegex).evaluate(with: self)
        
//        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "en_US_POSIX")
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//        if let date = formatter.date(from: self)
    }
}
