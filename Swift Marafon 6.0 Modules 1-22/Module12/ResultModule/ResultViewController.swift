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
    // MARK: - Private Properties

    private var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total  Per person"
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()

    private let total: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.textColor = .systemGreen
        label.text = "0"
        return label
    }()

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Total  Per person"
        label.textColor = .systemGray
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()

    private lazy var recalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Recalculate", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Public Methods
    // MARK: - IBActions
    // MARK: - Private Methods
    // MARK: - * <- extensions


}
