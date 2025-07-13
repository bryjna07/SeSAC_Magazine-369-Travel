//
//  GameViewController.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/11/25.
//

import UIKit

final class GameViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var textView: UITextView!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
    }


    private func configureUI() {
        
        // 플레이스 홀더 위치, 크기 조절
//        textField.borderStyle = .line
        textField.placeholder = "최대 숫자를 입력해주세요"
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1
        textField.returnKeyType = .done
        
        // 숫자 1부터 + , 표시
        textView.text = ""
        textView.font = .systemFont(ofSize: 20)
        textView.textColor = .gray
        textView.isEditable = false
        textView.textAlignment = .center
        
        // 3,6,9 포함 -> 박수이모지로 변경
        resultLabel.text = "결과"
        resultLabel.font = .boldSystemFont(ofSize: 30)
        resultLabel.textAlignment = .center
        
    }
    
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
        guard let text = textField.text, !text.isEmpty else { return }
        
        // 숫자만 입력
        guard let number = Int(text) else { return }
        
        var numberText = ""
        for i in 1...number {
            let a = "\(i)"
            let charArray = Array(a)
            
            var newString = ""
            for char in charArray {
                if char == "3" || char == "6" || char == "9" {
                    newString.append("👏")
                } else {
                    newString.append(char)
                }
                numberText += newString + ", "
            }
        
//            } else {
//                
//                if i == number {
//                    numberText += "\(i)"
//                } else {
//                    numberText += "\(i), " // 로직 정리, 생각 , 박수표시
//                }
//            }
        }
        //

        textView.text = numberText
        
    }
    
    @IBAction func keyboardDismiss(_ sender: Any) {
        view.endEditing(true)
    }
    
}

