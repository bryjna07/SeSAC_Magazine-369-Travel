//
//  GameViewController.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/11/25.
//

import UIKit

/// TextField 라이브러리
final class GameViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var textView: UITextView!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        
        textField.placeholder = Text.placeholder
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1
        textField.returnKeyType = .done
        
        textView.text = Text.blank
        textView.font = .systemFont(ofSize: 20)
        textView.textColor = .gray
        textView.isEditable = false
        textView.textAlignment = .center
        
        resultLabel.text = Text.guideText
        resultLabel.font = .boldSystemFont(ofSize: 30)
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
        
    }
    
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
        guard let text = textField.text, !text.isEmpty, let number = Int(text), number > 0, number <= 100 else {
            showAlert(title: Text.errorText, message: Text.guideText)
            return
        }
        
        var numberArray: [String] = []
        var totalClaps = 0
        
        for i in 1...number {
            
            let numberString = "\(i)"
            var newString = ""
            
            for char in numberString {
                if char == "3" || char == "6" || char == "9" {
                    newString += "👏"
                    totalClaps += 1
                } else {
                    newString += String(char)
                }
            }
            numberArray.append(newString)
        }
        textView.text = numberArray.joined(separator: ", ")
        resultLabel.text = "숫자 \(number)까지 총 박수는 \(totalClaps)번 입니다."
    }
    
    @IBAction func keyboardDismiss(_ sender: Any) {
        view.endEditing(true)
    }
}

