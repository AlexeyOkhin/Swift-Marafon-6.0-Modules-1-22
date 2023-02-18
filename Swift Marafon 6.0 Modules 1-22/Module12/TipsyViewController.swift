//
//  TipsyViewController.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 13.02.2023.
//

import UIKit

class TipsyViewController: UIViewController {

    // MARK: - IBOutlets
    // MARK: - Public Properties
    // MARK: - Private Properties
    var modelSplit = SplitModel(total: "", percent: 0, numSplit: 0)

    private let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter bill total"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }()

    private let priceTectField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 24)
        textField.textColor = .systemGreen
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        textField.placeholder = "enter price"

        return textField
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "mintView")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let selectLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.text = "Select tip"
        label.textColor = .systemGray
        return label
    }()
//MARK: - UIButton

    private lazy var percentButton1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("0%", for: .normal)
        button.addTarget(self, action: #selector(tapedButton), for: .touchUpInside)
        return button
    }()

    private lazy var percentButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("10%", for: .normal)
        button.addTarget(self, action: #selector(tapedButton), for: .touchUpInside)
        return button
    }()

    private lazy var percentButton3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("20%", for: .normal)
        button.addTarget(self, action: #selector(tapedButton), for: .touchUpInside)
        return button
    }()

    private let chooseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemGray
        label.text = "Choose Split"
        return label
    }()

    private let spliteLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemGreen
        label.textAlignment = .center
        label.text = "0"
        return label
    }()

    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.addTarget(self, action: #selector(tapSteper), for: .touchUpInside)
        return stepper
    }()

    private lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Calculate", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(calculateSplit), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        priceTectField.delegate = self
        setConstraints()
    }

    // MARK: - Public Methods

    @objc private func tapedButton(sender: UIButton) {
        resetButton()
        sender.backgroundColor = .green
        priceTectField.endEditing(true)
        switch sender.currentTitle {
        case "10%": modelSplit.percent = 0.1
        case "20%": modelSplit.percent = 0.2
        default: modelSplit.percent = 0.0
        }
    }

    @objc private func calculateSplit() {
        let resultVC = ResultViewController()
        resultVC.tottalPerPerson = modelSplit.resultSplit()

        present(resultVC, animated: true)

    }
    @objc private func tapSteper() {
        spliteLabel.text = String(format: "%g", stepper.value)
        modelSplit.numSplit = Float(stepper.value)
    }

    private func setConstraints() {

        let stackButton = UIStackView(arrangedSubviews: [percentButton1, percentButton2, percentButton3])
        stackButton.axis = .horizontal
        stackButton.distribution = .equalSpacing
        stackButton.spacing = 20

        let stackStepper = UIStackView(arrangedSubviews: [spliteLabel, stepper])
        stackStepper.axis = .horizontal
        stackStepper.distribution = .fill
        stackStepper.alignment = .center

        let mainGreenStack = UIStackView(arrangedSubviews: [selectLabel, stackButton, chooseLabel, stackStepper])
        mainGreenStack.axis = .vertical
        mainGreenStack.distribution = .fillEqually
        mainGreenStack.translatesAutoresizingMaskIntoConstraints = false

        let topStackView = UIStackView(arrangedSubviews: [totalLabel, priceTectField])
        topStackView.axis = .vertical
        topStackView.distribution = .fillEqually
        topStackView.translatesAutoresizingMaskIntoConstraints = false

        greenView.addSubview(mainGreenStack)
        greenView.addSubview(calculateButton)

        view.addSubview(topStackView)
        view.addSubview(greenView)

        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            topStackView.heightAnchor.constraint(equalToConstant: 120),

            greenView.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            mainGreenStack.topAnchor.constraint(equalTo: greenView.topAnchor),
            mainGreenStack.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 30),
            mainGreenStack.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: -30),
            mainGreenStack.heightAnchor.constraint(equalToConstant: 200),


            calculateButton.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: -30),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: 120),
            //calculateButton.heightAnchor.constraint(equalToConstant: 60)

        ])


    }
    // MARK: - IBActions
    // MARK: - Private Methods

    private func resetButton() {
        percentButton1.backgroundColor = .clear
        percentButton2.backgroundColor = .clear
        percentButton3.backgroundColor = .clear
    }
}

// MARK: - * <- extensions

extension TipsyViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        modelSplit.total += string
        return true
    }
}

