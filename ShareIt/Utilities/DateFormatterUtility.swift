//
//  DateFormatterUtility.swift
//  ShareIt
//
//  Created by Taoufik El Kadi on 27/12/2023.
//

import Foundation

struct DateUtility {

    static func formatDate(_ date: Date, format: String = "dd MMM yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }

}
