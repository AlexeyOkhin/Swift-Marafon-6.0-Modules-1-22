//
//  ResultViewController.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 14.02.2023.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: - IBOutlets
    // MARK: - Public Properties

    var tottalPerPerson: Float = 0.0
    
    // MARK: - Private Properties

    private var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total  Per person"
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let total: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.textColor = .systemGreen
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Total  Per person"
        label.textColor = .systemGray
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "mintView")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var recalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Recalculate", for: .normal)
        button.addTarget(self, action: #selector(recalculateSplit), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
        total.text = String(tottalPerPerson)

    }

    // MARK: - Public Methods
    // MARK: - IBActions
    // MARK: - Private Methods

    @objc private func recalculateSplit() {
        dismiss(animated: true)
    }

    private func setConstraints() {

        greenView.addSubview(totalLabel)
        greenView.addSubview(total)
        view.addSubview(greenView)
        view.addSubview(recalculateButton)

        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: view.topAnchor),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenView.heightAnchor.constraint(equalToConstant: 300),

            totalLabel.centerXAnchor.constraint(equalTo: greenView.centerXAnchor),
            totalLabel.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 30),
            total.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: -30),
            total.centerXAnchor.constraint(equalTo: greenView.centerXAnchor),

            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    // MARK: - * <- extensions


}
