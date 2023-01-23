//
//  XylaphoneViewController.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 22.01.2023.
//

import UIKit
import AVFoundation

class XylaphoneViewController: UIViewController {

    //MARK: -  Properties

    //MARK: - Private Properties
    private var buttonsXylaphone = [UIButton]()
    private let buttonName = ["A", "B", "C", "D", "E", "F", "G"]

    private let player = AVPlayer()

    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    //MARK: -  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        settingView()

    }
}

//MARK: - Private Methods
private extension XylaphoneViewController {
    func settingView() {
        makeButtons()
        buttonsXylaphone.forEach {
            mainStackView.addArrangedSubview($0)
        }

        view.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func makeButtons() {
        buttonName.forEach { name in
            let button = UIButton(type: .roundedRect)
            button.layer.cornerRadius = 20
            button.setTitle(name, for: .normal)
            button.backgroundColor = rndColor()
            button.titleLabel?.textColor = .white
            button.titleLabel?.font = .systemFont(ofSize: 30)
            button.addTarget(self, action: #selector(tapButton(sender:)), for: .touchUpInside)
            buttonsXylaphone.append(button)
        }
    }

    func rndColor() -> UIColor {
        return UIColor(
              red: CGFloat.random(in: 0...1),
              green: CGFloat.random(in: 0...1),
              blue: CGFloat.random(in: 0...1),
              alpha: 1.0)
    }

    @objc func tapButton(sender: UIButton) {
        print(sender.titleLabel?.text)

    }

}
