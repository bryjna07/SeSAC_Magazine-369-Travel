//
//  CityCell.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/15/25.
//

import UIKit
import Kingfisher

class CityCell: UITableViewCell {
    
    @IBOutlet var cityImageView: UIImageView!
    
    @IBOutlet var cityNameLabels: [UILabel]!
    
    @IBOutlet var dividerView: UIView!
    
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var explainLabel: UILabel!
    
    var city: City? {
        didSet {
            configureUIwithData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        cityImageView.image = .loading
        cityNameLabels[0].textColor = .white
        cityNameLabels[1].textColor = .white
        explainLabel.textColor = .white
    }

    private func configureUI() {
        
        selectionStyle = .none
        
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.clipsToBounds = true
        cityImageView.layer.cornerRadius = 20
        cityImageView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMaxYCorner)
        
        containerView.layer.cornerRadius = 20
        containerView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMaxYCorner)
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.8
        containerView.layer.shadowOffset = CGSize(width: 2, height: 2)
        containerView.layer.shadowRadius = 20
        
        cityNameLabels.forEach {
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 26, weight: .bold)
            
            dividerView.backgroundColor = .white
            
            containerView.backgroundColor = .black
            containerView.alpha = 0.5
            
            explainLabel.textColor = .white
            explainLabel.font = .systemFont(ofSize: 18, weight: .regular)
        }
    }
    
    private func configureUIwithData() {
        guard let city else { return }
        cityNameLabels[0].text = city.name
        cityNameLabels[1].text = city.englishName
        explainLabel.text = city.explain
        
        let url = URL(string: city.cityImage)
        cityImageView.setKFImage(from: url)
    }

}
