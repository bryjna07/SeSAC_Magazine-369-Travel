//
//  CityDetailViewController.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/16/25.
//

import UIKit

final class CityDetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var labels: [UILabel]!
    
    var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureUIwithData()
    }
    
    private func configureUI() {
        labels.forEach {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 18, weight: .regular)
        }
    }
    
    private func configureUIwithData() {
        guard let city else { return }
        labels[0].text = city.name
        labels[1].text = city.englishName
        labels[2].text = city.explain
        
        let url = URL(string: city.cityImage)
        imageView.kf.setImage(with: url, placeholder: UIImage(named: Image.loadImage))
    }
    
}
