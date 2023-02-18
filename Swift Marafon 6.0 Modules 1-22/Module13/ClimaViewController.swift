//
//  ClimaViewController.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 18.02.2023.
//

import UIKit

class ClimaViewController: UIViewController {

    // MARK: - Public Properties
    // MARK: - Private Properties

    let navigationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "search"
        textField.tintColor = .label
        textField.textAlignment = .right
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemFill
        return textField
    }()

    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cloud.rain")
        imageView.tintColor = .label
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 80)
        label.text = "20℃ "
        label.textColor = .label
        return label
    }()

    let cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 50)
        label.text = "Moscow"
        return label
    }()


    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }

    override func viewWillLayoutSubviews() {
        setupBackGround(name: "climaBackground")

    }

    // MARK: - Public Methods
    // MARK: - IBActions
    // MARK: - Private Methods
}

// MARK: - * <- private extensions

private extension ClimaViewController {
    func setupBackGround(name: String) {
        let imageView = UIImageView(image: UIImage(named: name))
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
        imageView.frame = view.bounds
    }

    func setupConstraints() {

        let topStack = UIStackView(arrangedSubviews: [navigationButton, searchTextField, searchButton])
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.axis = .horizontal
        topStack.distribution = .fillProportionally

        view.addSubview(topStack)

        NSLayoutConstraint.activate([
            topStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            searchButton.heightAnchor.constraint(equalToConstant: 44),
            searchButton.widthAnchor.constraint(equalToConstant: 44),

            navigationButton.heightAnchor.constraint(equalToConstant: 44),
            navigationButton.widthAnchor.constraint(equalToConstant: 44),

        ])

        temperatureLabel.attributedText = makeTemperatureText(with: "22")

        let mainStack = UIStackView(arrangedSubviews: [weatherImage, temperatureLabel, cityLabel])
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .vertical
        mainStack.alignment = .trailing

        view.addSubview(mainStack)

        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            weatherImage.heightAnchor.constraint(equalToConstant: 145),
            weatherImage.widthAnchor.constraint(equalToConstant: 145),


        ])
    }

    private func makeTemperatureText(with temperature: String) -> NSAttributedString {

        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.foregroundColor] = UIColor.label
        boldTextAttributes[.font] = UIFont.boldSystemFont(ofSize: 100)

        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.systemFont(ofSize: 80)

        let text = NSMutableAttributedString(string: temperature, attributes: boldTextAttributes)
        text.append(NSAttributedString(string: "°C", attributes: plainTextAttributes))

        return text
    }

}

