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
    }

    private func configureUI() {
        
        selectionStyle = .none
        
        cityImageView.contentMode = .scaleAspectFill
        
        /// 그림자 안먹음
//        cityImageView.layer.shadowColor = UIColor.black.cgColor
//        cityImageView.layer.shadowOpacity = 0.4
//        cityImageView.layer.shadowOffset = CGSize(width: 8, height: 8)
//        cityImageView.layer.shadowRadius = 20
    
        
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
        explainLabel.text = " \(city.explain)"
        
        let url = URL(string: city.cityImage)
        cityImageView.kf.setImage(with: url, placeholder: UIImage(named: Image.loadImage))
    }

}
