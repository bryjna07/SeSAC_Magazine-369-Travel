//
//  TravelTableViewCell.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/11/25.
//

import UIKit
import Kingfisher

final class TravelTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var starImageViews: [UIImageView]!
    @IBOutlet var starStackView: UIStackView!
    
    @IBOutlet var saveCountLabel: UILabel!
    @IBOutlet var horizontalStack: UIStackView!
    
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    var travel: Travel? {
        didSet {
            configureUIwithData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mainImageView.image = .loading
    }
    
    private func configureUI() {
        
        selectionStyle = .none
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 0
        
        saveCountLabel.textAlignment = .left
        
        saveCountLabel.font = .systemFont(ofSize: 14)
        saveCountLabel.textColor = .gray
        
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.layer.cornerRadius = 10
        mainImageView.clipsToBounds = true
        
        likeButton.setTitle(Text.blank, for: .normal)
        likeButton.tintColor = .systemPink
        likeButton.backgroundColor = .clear
    }
    
    private func configureUIwithData() {
        guard let travel else { return }
        titleLabel.text = travel.title
        descriptionLabel.text = travel.description
        
        guard let grade = travel.grade else { return }
        configureStarImages(grade)
        
        guard let saveCount = travel.save else { return }
        saveCountLabel.text = "저장 \(saveCount.formattedWithComma())"
        
        guard let liked = travel.like else { return }
        
        let likeImage = liked ? Image.heart : Image.heartFill
        likeButton.setImage(UIImage(systemName: likeImage), for: .normal)
        
        if let imageUrl = travel.image, let url = URL(string: imageUrl) {
            mainImageView.kf.setImage(with: url, placeholder: UIImage(named: Image.loadImage))
        }
    }
    
    /// 별 갯수 디테일 수정 필요
    private func configureStarImages(_ grade: Double) {
        for (index, imageView) in starImageViews.enumerated() {
            let starIndex = Double(index)
            let difference = grade - starIndex

            let imageName: String

            if difference >= 1.0 {
                imageName = Image.starFill
            } else if difference >= 0.5 {
                imageName = Image.starHalf
            } else {
                imageName = Image.star
            }

            imageView.image = UIImage(systemName: imageName)
            imageView.tintColor = .systemYellow
        }
    }
}
