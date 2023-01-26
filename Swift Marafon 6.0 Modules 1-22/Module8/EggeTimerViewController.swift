//
//  EggeTimerViewController.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 25.01.2023.
//

import UIKit
import AVFoundation

final class EggeTimerViewController: UIViewController {

    //MARK: - Properies

    //MARK: - Private Properties

    private let titleText = "Выберите крутость варки яйца)"
    private lazy var doneText = "Готово!"

    private let eggeStatusNames = ["softEgg": 9, "mediumEgg": 12, "hardEgg": 15]

    private let titleLabel = UILabel()
    private let progressEgg = UIProgressView()
    private var timerEgg = Timer()
    private var totalTime = 0
    private var remainderTime = 0
    private var player: AVPlayer?

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
        let sortedEgg = eggeStatusNames.sorted {
            $0.value < $1.value
        }

        sortedEgg.forEach { egge, time in
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

        titleLabel.text = titleText
        titleLabel.font = .systemFont(ofSize: 22)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0

        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])

        makeEggesButtons()

        progressEgg.progressTintColor = .systemYellow
        progressEgg.trackTintColor = .systemGray
        progressEgg.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(progressEgg)

        NSLayoutConstraint.activate([
            progressEgg.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            progressEgg.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            progressEgg.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            progressEgg.heightAnchor.constraint(equalToConstant: 10)
        ])

    }

    //MARK: - Objc Methods

    @objc func tapEgge(sender: UIButton) {
        titleLabel.text = sender.currentTitle
        progressEgg.progress = 0
        timerEgg.invalidate()
        totalTime = 0
        remainderTime = eggeStatusNames[(sender.titleLabel?.text)!]!
        timerEgg = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {

        if totalTime < remainderTime {
            totalTime += 1
            startProgress()
        } else {
            titleLabel.text = doneText
            timerEgg.invalidate()
            playSound()
        }
    }

    func playSound() {
        guard let urlSound = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        player = AVPlayer(url: urlSound)
        player?.play()
    }

    func startProgress() {
        let precent = Float(totalTime) / Float(remainderTime)
        if precent < 0.3 {
            progressEgg.progressTintColor = .red
        } else if precent < 0.7 {
            progressEgg.progressTintColor = .yellow
        } else {
            progressEgg.progressTintColor = .green
        }
        progressEgg.progress = precent
    }
}
