//
//  QuizzlerViewController.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 31.01.2023.
//

import UIKit

class QuizzlerViewController: UIViewController {

    private let questions = Questions.sampleData
    private var numberQuestion = 0

    private let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    private let progressBarAnswer: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .systemPink
        progressView.trackTintColor = .systemGray
        return progressView
    }()

    private let bottomImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "module9Bubbles"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let trueButton = UIButton(answerText: "TRUE", border: true, backgroundColor: .systemBlue, textColor: .white)
    private let falseButton = UIButton(answerText: "FALSE", border: true, backgroundColor: .systemBlue, textColor: .white)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.systemIndigo

        settingView()
        updateUI()
    }
}

private extension QuizzlerViewController {
    func updateUI() {
        questionLabel.text = questions[numberQuestion].question
    }

    func settingView() {
        setLayout()
        trueButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        falseButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)

    }

    func setLayout() {
        view.addSubview(bottomImage)

        NSLayoutConstraint.activate([
            bottomImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomImage.heightAnchor.constraint(equalToConstant: 80)
        ])

        view.addSubview(progressBarAnswer)

        NSLayoutConstraint.activate([
            progressBarAnswer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            progressBarAnswer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            progressBarAnswer.bottomAnchor.constraint(equalTo: bottomImage.topAnchor, constant: -6),
            progressBarAnswer.heightAnchor.constraint(equalToConstant: 10)
        ])

        let stackButton = UIStackView(arrangedSubviews: [trueButton, falseButton])
        stackButton.translatesAutoresizingMaskIntoConstraints = false
        stackButton.axis = .vertical
        stackButton.distribution = .fillEqually
        stackButton.alignment = .fill
        stackButton.spacing = 16

        view.addSubview(stackButton)

        NSLayoutConstraint.activate([
            stackButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackButton.bottomAnchor.constraint(equalTo: progressBarAnswer.topAnchor, constant: -16),
            stackButton.heightAnchor.constraint(equalToConstant: 120)
        ])

        view.addSubview(questionLabel)

        NSLayoutConstraint.activate([
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            questionLabel.bottomAnchor.constraint(equalTo: stackButton.topAnchor, constant: -16)
        ])
    }

    @objc func tapButton(sender: UIButton) {
        numberQuestion += 1
        updateUI()
        print("ghyn")
    }
}
