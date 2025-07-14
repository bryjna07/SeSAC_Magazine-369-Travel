//
//  MagazineTableViewCell.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/11/25.
//

import UIKit
import Kingfisher

final class MagazineTableViewCell: UITableViewCell {
    
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
        photoimageView.image = .loading
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
        dateLabel.text = formatDate(magazine.date)
        guard let url = URL(string: magazine.image) else { return }
        photoimageView.kf.setImage(with: url, placeholder: UIImage(named: Image.loadImage))
    }
    
    /// Extension으로
    // Date 형식 변환
    private func formatDate(_ dateString: String) -> String {
        let forMattter = DateFormatter()
        forMattter.dateFormat = DateText.beforeText
        
        if let date = forMattter.date(from: dateString
        ) {
            forMattter.dateFormat = DateText.afterText
            return forMattter.string(from: date)
        } else { return Text.blank}
    }
}
