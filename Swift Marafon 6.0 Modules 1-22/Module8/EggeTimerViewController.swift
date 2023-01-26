//
//  EggeTimerViewController.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 25.01.2023.
//

import UIKit

final class EggeTimerViewController: UIViewController {

    //MARK: - Properies

    //MARK: - Private Properties

    private let eggeStatusNames = ["softEgg", "mediumEgg", "hardEgg"]

    private let eggeHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.contentHuggingPriority(for: .vertical)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()

    }
}

private extension EggeTimerViewController {
    func makeEggesButtons() {
        eggeStatusNames.forEach { egge in
            let eggeButton = UIButton(type: .system)
            eggeButton.setBackgroundImage(UIImage(named: egge), for: .normal)
            eggeButton.setTitle(egge, for: .normal)
            eggeButton.translatesAutoresizingMaskIntoConstraints = false
            eggeButton.heightAnchor.constraint(equalToConstant: 160).isActive = true
            eggeButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
            eggeButton.tintColor = .black
            eggeButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
            eggeButton.addTarget(self, action: #selector(tapEgge), for: .touchUpInside)
            eggeHorizontalStack.addArrangedSubview(eggeButton)
        }

        view.addSubview(eggeHorizontalStack)
        NSLayoutConstraint.activate([
            eggeHorizontalStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            eggeHorizontalStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            eggeHorizontalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func settingView() {
        view.backgroundColor = .systemCyan

        makeEggesButtons()

    }

    //MARK: - Objc Methods

    @objc func tapEgge(sender: UIButton) {
        print(sender.titleLabel?.text)
    }
}
