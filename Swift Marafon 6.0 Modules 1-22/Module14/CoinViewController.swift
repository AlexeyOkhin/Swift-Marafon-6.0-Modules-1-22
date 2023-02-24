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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var coinTypeLabel: UILabel = {
        let label = UILabel()
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
        view.backgroundColor = .systemTeal
    }

    private func setConstraints() {
        view
    }

}
