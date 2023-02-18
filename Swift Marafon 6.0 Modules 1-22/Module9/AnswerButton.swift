//
//  AnswerButton.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 31.01.2023.
//

import UIKit

extension UIButton {

    convenience init(answerText: String, border: Bool, backgroundColor: UIColor, textColor: UIColor) {
        self.init(type: .system)
        self.setTitle(answerText, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 20)
        self.backgroundColor = backgroundColor
        self.setTitleColor(textColor, for: .normal)

        if border {
            self.layer.borderColor = UIColor.darkGray.cgColor
            self.layer.borderWidth = 1
            self.layer.cornerRadius = 10
        }

    }
}

