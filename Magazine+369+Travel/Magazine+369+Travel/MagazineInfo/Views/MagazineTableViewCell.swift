//
//  MagazineTableViewCell.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/11/25.
//

import UIKit

class MagazineTableViewCell: UITableViewCell {

    @IBOutlet var photoimageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var subTitleLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
        configureCell()
    }

    private func configureCell() {
        selectionStyle = .none
        
        photoimageView.contentMode = .scaleAspectFill
        photoimageView.layer.cornerRadius = 10
        photoimageView.clipsToBounds = true
        
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 0
        
        subTitleLabel.textColor = .gray
        subTitleLabel.font = .systemFont(ofSize: 16)
        
        /// TODO - DateFormatter
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textAlignment = .right
    }

}
