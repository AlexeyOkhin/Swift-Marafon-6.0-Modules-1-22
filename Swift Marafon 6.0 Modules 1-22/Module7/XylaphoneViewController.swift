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

    private var player: AVAudioPlayer?

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
            let button = UIButton(type: .system)
            button.layer.cornerRadius = 20
            button.setTitle(name, for: .normal)
            button.backgroundColor = rndColor()
            button.tintColor = .white
            button.titleLabel?.font = .systemFont(ofSize: 30)
            button.addTarget(self, action: #selector(tapButton(sender:)), for: .touchDown)
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
        animationTapButton(button: sender)
        playSound(button: sender)


    }

    func animationTapButton(button: UIButton) {

        UIView.animateKeyframes(withDuration: 0.3, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                button.transform = CGAffineTransform.identity
            }
        }
    }

    func playSound(button: UIButton) {
        let nameSound = button.titleLabel?.text
        if let urlSound = Bundle.main.url(forResource: nameSound, withExtension: "wav") {
            player = try? AVAudioPlayer(contentsOf: urlSound, fileTypeHint: "wav")
            player?.play()
        }
    }

}
