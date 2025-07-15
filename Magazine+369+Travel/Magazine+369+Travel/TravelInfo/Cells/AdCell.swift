//
//  AdCell.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/13/25.
//

import UIKit

final class AdCell: UITableViewCell {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var adTextLabel: UILabel!
    
    private let colors: [UIColor] = [#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),]
    
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
