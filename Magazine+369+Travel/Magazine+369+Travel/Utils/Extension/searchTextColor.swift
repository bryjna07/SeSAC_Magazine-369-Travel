//
//  searchTextColor.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/16/25.
//

import UIKit

extension UILabel {
    func searchTextColor(targetString: String, color: UIColor) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        attributedText = attributedString
    }
}
