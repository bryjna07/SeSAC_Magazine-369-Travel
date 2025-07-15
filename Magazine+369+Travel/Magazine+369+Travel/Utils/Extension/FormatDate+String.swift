//
//  FormatDate+String.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/15/25.
//

import Foundation

extension String {
    func formatDate() -> String {
        let forMattter = DateFormatter()
        forMattter.dateFormat = DateText.beforeText
        
        if let date = forMattter.date(from: self
        ) {
            forMattter.dateFormat = DateText.afterText
            return forMattter.string(from: date)
        } else { return Text.blank}
    }
}
