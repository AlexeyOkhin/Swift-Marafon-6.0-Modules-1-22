//
//  UIView + Extensions.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 22.01.2023.
//

import UIKit

extension UIImageView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = 3
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
