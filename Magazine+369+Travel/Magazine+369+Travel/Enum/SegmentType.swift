//
//  SegmentType.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/18/25.
//

import Foundation

enum SegmentType: Int, CaseIterable {
    case all = 0
    case domestic
    case abroad
    
    var title: String {
        switch self {
        case .all: return "모두"
        case .domestic: return "국내"
        case .abroad: return "해외"
        }
    }
    
    func filtered(from list: [City]) -> [City] {
        switch self {
        case .all:
            return list
        case .domestic:
            return list.filter { $0.domesticTravel }
        case .abroad:
            return list.filter { !$0.domesticTravel }
        }
    }
}
