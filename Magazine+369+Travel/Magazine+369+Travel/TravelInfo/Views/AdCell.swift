//
//  AdCell.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/13/25.
//

import UIKit

class AdCell: UITableViewCell {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var adTextLabel: UILabel!
    
    let colors: [UIColor] = [
        .systemBlue,
        .systemOrange,
        .systemTeal,
        .systemPink,
        .systemGray,
    ]
    
    var travel: Travel? {
        didSet {
            configureWithData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    func configureUI() {
        containerView.backgroundColor = colors.randomElement()
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        
        adLabel.text = Text.ad
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 5
        adLabel.clipsToBounds = true
        adLabel.font = .systemFont(ofSize: 16, weight: .medium)
        adLabel.textAlignment = .center
        
        adTextLabel.textColor = .black
        adTextLabel.font = .boldSystemFont(ofSize: 20)
        adTextLabel.textAlignment = .center
        adTextLabel.numberOfLines = 0
    }
    
    private func configureWithData() {
        guard let travel else { return }
        adTextLabel.text = travel.title
    }

}
