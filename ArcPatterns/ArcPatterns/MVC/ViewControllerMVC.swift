//
//  ViewControllerMVC.swift
//  ArcPatterns
//
//  Created by Maxim V. Sidorov on 2/21/21.
//

import UIKit

class ViewControllerMVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        showName()
    }

    private func showName() {
        let person = getPerson()
        let personView = PersonViewMVC(person: person)

        view.addSubview(personView)
        personView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            personView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            personView.widthAnchor.constraint(equalToConstant: 200),
            personView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func getPerson() -> PersonMVC {
        let person = PersonMVC(name: "NameMVC")
        return person
    }
}

