//
//  PlaceViewController.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/15/25.
//

import UIKit

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
        
        titleLabel.font = .boldSystemFont(ofSize: 40)
        titleLabel.textAlignment = .center
        
        subTitleLabel.font = .systemFont(ofSize: 26, weight: .medium)
        subTitleLabel.textAlignment = .center
        subTitleLabel.numberOfLines = 0
        
        backButton.setTitle(Text.travelBackButton, for: .normal)
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
        placeImageView.setKFImage(from: url)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
