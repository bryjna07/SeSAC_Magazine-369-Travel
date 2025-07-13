//
//  Double+NumberFormatter.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/14/25.
//

import Foundation

extension Double {
    func formattedWithComma() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self)) ?? "0"
    }
}
