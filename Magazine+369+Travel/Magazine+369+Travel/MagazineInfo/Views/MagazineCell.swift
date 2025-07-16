//
//  MagazineCell.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/11/25.
//

import UIKit
import Kingfisher

final class MagazineCell: UITableViewCell {
    
    @IBOutlet var photoimageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var magazine: Magazine? {
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
//        photoimageView.image = .loading
    }
    
    private func configureUI() {
        selectionStyle = .none
        
        photoimageView.contentMode = .scaleAspectFill
        photoimageView.layer.cornerRadius = 10
        photoimageView.clipsToBounds = true
        
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 0
        
        subTitleLabel.textColor = .gray
        subTitleLabel.font = .systemFont(ofSize: 16)
        
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textAlignment = .right
    }
    
    private func configureUIwithData() {
        guard let magazine else { return }
        titleLabel.text = magazine.title
        subTitleLabel.text = magazine.subtitle
        dateLabel.text = magazine.date.formatDate()
        
        guard let url = URL(string: magazine.image) else { return }
        
        photoimageView.setKFImage(from: url)
    }
}
