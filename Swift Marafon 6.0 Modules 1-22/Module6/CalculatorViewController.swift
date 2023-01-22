//
//  CalculatorViewController.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 22.01.2023.
//

import UIKit

class CalculatorViewController: UIViewController {

    private var vertikalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 1
        return stack
    }()

    private var displayLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .darkGray
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()

    private var arrayButton = [[UIButton]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        settingConstraints()
    }
}

private extension CalculatorViewController {
    func settingConstraints() {
    makeButton()
    makeLayout()
    }

    func makeButton() {
        var arraySymbols = [["0", ".", "="], ["1", "2", "3", "+"], ["4", "5", "6", "-"], ["7", "8", "9", "X"], ["AC", "+/-", "%", "/"]]
        arraySymbols.forEach { array in
            var arButton = [UIButton]()
            array.forEach { symbol in

                let button = UIButton(type: .system)

                button.setTitleColor(.white, for: .normal)
                button.titleLabel?.font = .systemFont(ofSize: 32)
                button.setTitle(symbol, for: .normal)

                switch symbol {
                case (let char) where char == "/" || char == "X" || char == "-" || char == "+" || char == "=":
                    button.backgroundColor = .systemOrange
                case (let char) where char == "AC" || char == "+/-" || char == "%":
                    button.backgroundColor = .systemGray
                default:
                    button.backgroundColor = .tintColor
                }

                arButton.append(button)
            }
            arrayButton.append(arButton)
        }
    }

    func makeLayout() {
        vertikalStack.addArrangedSubview(displayLabel)
        arrayButton.reverse()

        let horizontalStackBottom1 = UIStackView()
        horizontalStackBottom1.axis = .horizontal
        horizontalStackBottom1.distribution = .fillEqually


        let horizontalStackBottom2 = UIStackView()
        horizontalStackBottom2.axis = .horizontal
        horizontalStackBottom2.distribution = .fillEqually
        horizontalStackBottom2.spacing = 1

        arrayButton.forEach { buttons in
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.distribution = .fillEqually
            horizontalStack.spacing = 1
            buttons.forEach { button in
                if button.titleLabel?.text == "0" {
                    horizontalStackBottom1.addArrangedSubview(button)
                }
                    else if button.titleLabel?.text == "." || button.titleLabel?.text == "=" {
                        horizontalStackBottom2.addArrangedSubview(button)

                } else {
                    horizontalStack.addArrangedSubview(button)
                }
            }
            horizontalStack.addArrangedSubview(horizontalStackBottom1)
            horizontalStack.addArrangedSubview(horizontalStackBottom2)

            vertikalStack.addArrangedSubview(horizontalStack)
        }

        view.addSubview(vertikalStack)

        NSLayoutConstraint.activate([
            vertikalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vertikalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vertikalStack.topAnchor.constraint(equalTo: view.topAnchor),
            vertikalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

