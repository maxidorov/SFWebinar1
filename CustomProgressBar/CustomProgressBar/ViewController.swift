//
//  ViewController.swift
//  CustomProgressBar
//
//  Created by Maxim V. Sidorov on 1/25/21.
//

import UIKit

class ViewController: UIViewController {

    let progressBar = CustomProgressBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProgressBar()
        animateProgressBar()
    }

    private func setupProgressBar() {
        let progressBarColor = UIColor.purple
        progressBar.totalComponents = 5
        progressBar.filledComponents = 2
        progressBar.spacing = 4
        progressBar.unfilledColor = progressBarColor.withAlphaComponent(0.3)
        progressBar.filledColor = progressBarColor
        progressBar.cornerRadius = 5
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressBar)
        NSLayoutConstraint.activate([
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            progressBar.heightAnchor.constraint(equalToConstant: 10)
        ])
    }

    private func animateProgressBar() {
        var filledComponents: UInt = 0
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            self.progressBar.filledComponents = filledComponents % (self.progressBar.totalComponents + 1)
            self.progressBar.render()
            filledComponents += 1
            print(1)
        }
    }
}

