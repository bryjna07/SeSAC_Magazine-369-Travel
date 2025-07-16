//
//  PlaceViewController.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/15/25.
//

import UIKit
import Kingfisher

final class PlaceViewController: UIViewController {

    @IBOutlet var placeImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var subTitleLabel: UILabel!
    
    @IBOutlet var backButton: UIButton!
    
    var travel: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureUIWithData()
    }
    
    private func configureUI() {
        placeImageView.layer.cornerRadius = 10
        placeImageView.clipsToBounds = true
        placeImageView.contentMode = .scaleAspectFill
        placeImageView.backgroundColor = .brown
        
        titleLabel.font = .boldSystemFont(ofSize: 40)
        titleLabel.textAlignment = .center
        
        subTitleLabel.font = .systemFont(ofSize: 26, weight: .medium)
        subTitleLabel.textAlignment = .center
        subTitleLabel.numberOfLines = 0
        
        backButton.setTitle("다른 관광지 보러가기", for: .normal)
        backButton.backgroundColor = .blue
        backButton.setTitleColor(.white, for: .normal)
        backButton.layer.cornerRadius = 16
        backButton.clipsToBounds = true
        
    }
    
    private func configureUIWithData() {
        guard let travel else { return }
        titleLabel.text = travel.title
        subTitleLabel.text = travel.description
        
        guard let image = travel.image else { return }
        let url = URL(string: image)
        placeImageView.kf.setImage(with: url, placeholder: UIImage(resource: .loading))
        
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
