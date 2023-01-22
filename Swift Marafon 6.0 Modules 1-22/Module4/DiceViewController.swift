//
//  MagicBallViewController.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 22.01.2023.
//

import UIKit
import CoreMotion

class DiceViewController: UIViewController {

    private var randomNumber: Int {
        Int.random(in: 1...6)
    }

    private var mainVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemRed
        button.setTitle("Roll", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tapStart), for: .touchUpInside)
        return button
    }()

    private var dice1 = UIImageView()
    private var dice2 = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackground(name: "newbackground")
        makeConstraints()

    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        animationDice()
        chaigeDice()
    }


}

private extension DiceViewController {
    func setBackground(name: String) {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: name)

        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }

    func makeConstraints() {
        let stackTop = UIStackView()
        stackTop.distribution = .equalCentering
        stackTop.alignment = .center

        let imageViewLogo = UIImageView(image: UIImage(named: "diceeLogo"))
        stackTop.addArrangedSubview(imageViewLogo)

        let stackMiddle = UIStackView()
        stackMiddle.distribution = .fillEqually
        stackMiddle.axis = .horizontal
        stackMiddle.spacing = 40
        stackMiddle.alignment = .center

        dice1.image = UIImage(named: "dice\(randomNumber)")
        dice2.image = UIImage(named: "dice\(randomNumber)")

        stackMiddle.addArrangedSubview(dice1)
        stackMiddle.addArrangedSubview(dice2)

        let stackBottom = UIStackView()
        stackBottom.distribution = .equalCentering
        stackBottom.alignment = .center

        stackBottom.addArrangedSubview(startButton)

        mainVerticalStack.addArrangedSubview(stackTop)
        mainVerticalStack.addArrangedSubview(stackMiddle)
        mainVerticalStack.addArrangedSubview(stackBottom)

        view.addSubview(mainVerticalStack)

        NSLayoutConstraint.activate([
            mainVerticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainVerticalStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainVerticalStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -56),
            mainVerticalStack.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 56)
        ])

    }

    @objc func tapStart() {
        animationDice()
        chaigeDice()
    }

    func animationDice() {
        dice1.rotate()
        dice2.rotate()
    }

    func chaigeDice() {

        dice1.image = UIImage(named: "dice\(randomNumber)")
        dice2.image = UIImage(named: "dice\(randomNumber)")

    }
}
