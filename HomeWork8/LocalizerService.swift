//
//  LocalizerService.swift
//  HomeWork8
//
//  Created by Pavel Antonov on 27.02.2020.
//  Copyright © 2020 OtusCourse. All rights reserved.
//

import Foundation

struct LocalizerService {
    let locale: Locale

    func localizeDate(from: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = formatter.date(from: from) {
            formatter.locale = locale
            formatter.setLocalizedDateFormatFromTemplate("dMMMMyEEEE HH:mm:ss")
            return formatter.string(from: date)
        }
        return "Unknown date"
    }
}
