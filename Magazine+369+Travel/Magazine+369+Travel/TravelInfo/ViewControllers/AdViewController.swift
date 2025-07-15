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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        adLabel.text = "ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"
        adLabel.font = .systemFont(ofSize: 30, weight: .medium)
        adLabel.numberOfLines = 0
        
        exitButton.setTitle("X", for: .normal)
        exitButton.setTitleColor(.black, for: .normal)
        
    }
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
