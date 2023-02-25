//
//  CoinViewController.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 24.02.2023.
//

import UIKit

class CoinViewController: UIViewController {

    private lazy var coinPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()

    private lazy var coinValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Value"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var coinTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "USD"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var coinImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "bitcoinsign.circle.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        return imageView

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        coinPicker.delegate = self
        coinPicker.dataSource = self
        view.backgroundColor = .systemTeal
    }

    private func setConstraints() {
        let topStack = UIStackView(arrangedSubviews: [coinImageView, coinValueLabel, coinTypeLabel])
        topStack.axis = .horizontal
        topStack.distribution = .fillEqually
        topStack.backgroundColor = .systemGray4
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.layer.cornerRadius = 20

        view.addSubview(topStack)
        view.addSubview(coinPicker)

        NSLayoutConstraint.activate([
            topStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            topStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            topStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topStack.heightAnchor.constraint(equalToConstant: 60),

            coinPicker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            coinPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            coinPicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            //coinPicker.heightAnchor.constraint(equalToConstant: 80)
        ])

    }

}

extension CoinViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        CoinManager().currencyArray.count
    }
}

extension CoinViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CoinManager().currencyArray[row]
    }
}

extension CoinViewController: CoinServiceDelegate {
    func didFetchCurse(_ coinService: CoinManager, _ coin: CoinModel) {

    }
}
