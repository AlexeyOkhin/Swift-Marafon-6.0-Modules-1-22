//
//  MagikBallViewController.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 22.01.2023.
//

import UIKit
import CoreMotion

class MagikBallViewController: UIViewController {
    private var variantAnswers = [UIImage]()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 28)
        label.text = "Загадай желание и потряси..."
        return label
    }()

    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        view.backgroundColor = .systemTeal
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        setupAnswer()
    }

    private func settingView() {
        makeConstrents()
    }

    private func setupAnswer() {
        let randomAnswer = Int.random(in: 1...5)
        imageView.image = UIImage(named: "ball\(randomAnswer).png")
    }

    private func makeConstrents() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])

        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 280),
            imageView.heightAnchor.constraint(equalToConstant: 280)
        ])
    }

}


