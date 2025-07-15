//
//  PlaceViewController.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/15/25.
//

import UIKit

class PlaceViewController: UIViewController {

    @IBOutlet var placeImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var subTitleLabel: UILabel!
    
    @IBOutlet var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
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
        
        titleLabel.text = "카오산 로드"
        subTitleLabel.text = "낮과 밤 서로 다른 매력을 지닌 번화한 거리"
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
