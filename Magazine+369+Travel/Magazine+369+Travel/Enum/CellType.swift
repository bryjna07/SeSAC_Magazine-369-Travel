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
    case city
    
    var id: String {
        switch self {
        case .magazine:
            return "MagazineCell"
        case .travel:
            return "TravelCell"
        case .ad:
            return "AdCell"
        case .city:
            return "CityCell"
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
        case .city:
            return UINib(nibName: self.id, bundle: nil)
        }
    }
}
