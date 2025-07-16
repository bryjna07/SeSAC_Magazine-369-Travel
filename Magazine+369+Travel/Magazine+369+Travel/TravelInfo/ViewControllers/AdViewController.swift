//
//  AdViewController.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/15/25.
//

import UIKit

class AdViewController: UIViewController {

    @IBOutlet var adLabel: UILabel!
    
    @IBOutlet var exitButton: UIButton!
    
    var travel: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        adLabel.font = .systemFont(ofSize: 30, weight: .medium)
        adLabel.numberOfLines = 0
        
        exitButton.setTitle("X", for: .normal)
        exitButton.setTitleColor(.black, for: .normal)
        
        guard let travel else { return }
        adLabel.text = travel.title
    }
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
