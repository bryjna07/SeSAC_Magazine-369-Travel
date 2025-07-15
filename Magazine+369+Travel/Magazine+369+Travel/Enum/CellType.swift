//
//  CellType.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/15/25.
//

import UIKit

enum CellType {
    case magazine
    case travel
    case ad
    
    var id: String {
        switch self {
        case .magazine:
            return "MagazineCell"
        case .travel:
            return "TravelCell"
        case .ad:
            return "AdCell"
        }
    }
    
    var nib: UINib {
        switch self {
        case .magazine:
            return UINib(nibName: self.id, bundle: nil)
        case .travel:
            return UINib(nibName: self.id, bundle: nil)
        case .ad:
            return UINib(nibName: self.id, bundle: nil)
        }
    }
}
