//
//  CityCollectionViewCell.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/17/25.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cityImageView: UIImageView!
    
    @IBOutlet var cityNameLabel: UILabel!
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.clipsToBounds = true
        cityImageView.layer.cornerRadius = cityImageView.bounds.width / 2
    }
    
    override func prepareForReuse() {
        cityImageView.image = .loading
        cityNameLabel.textColor = .black
        explainLabel.textColor = .gray
    }
    
    private func configureUI() {
        
        cityNameLabel.textColor = .black
        cityNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        cityNameLabel.textAlignment = .center
        
        explainLabel.textColor = .gray
        explainLabel.font = .systemFont(ofSize: 14, weight: .regular)
        explainLabel.numberOfLines = 0
        explainLabel.textAlignment = .center
    }
    
    
    private func configureUIwithData() {
        guard let city else { return }
        cityNameLabel.text = "\(city.name)" + " | " + "\(city.englishName)"
        explainLabel.text = city.explain
        
        let url = URL(string: city.cityImage)
        cityImageView.setKFImage(from: url)
    }
    
}
