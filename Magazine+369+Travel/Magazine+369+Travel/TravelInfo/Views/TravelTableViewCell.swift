//
//  TravelTableViewCell.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/11/25.
//

import UIKit
import Kingfisher

class TravelTableViewCell: UITableViewCell {

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
        mainImageView.image = nil
    }

    private func configureUI() {
        
        selectionStyle = .none
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 0
        
        starImageViews.forEach {
            $0.image = UIImage(systemName: Image.star)
        }
        
        horizontalStack.alignment = .leading
        
        saveCountLabel.font = .systemFont(ofSize: 14)
        saveCountLabel.textColor = .gray
        
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.layer.cornerRadius = 10
        mainImageView.clipsToBounds = true
        
        likeButton.setTitle(Text.blank, for: .normal)
        
    }
    
    func configureUIwithData() {
        guard let travel else { return }
        titleLabel.text = travel.title
        descriptionLabel.text = travel.description
        
        guard let saveCount = travel.save else { return }
        saveCountLabel.text = "저장 \(saveCount)"
        
        guard let liked = travel.like else { return }
                
        let likeImage = liked ? Image.heart : Image.heartFill
            likeButton.setImage(UIImage(systemName: likeImage), for: .normal)
        if let imageUrl = travel.image, let url = URL(string: imageUrl) {
            mainImageView.kf.setImage(with: url)
        }
    }
}
