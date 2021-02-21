//
//  ViewControllerVIPER.swift
//  ArcPatterns
//
//  Created by Maxim V. Sidorov on 2/21/21.
//

import Foundation
import UIKit

protocol ViewControllerProtocolVIPER: class {
    func showPerson(_ person: PersonMVC)
}

class ViewControllerVIPER: UIViewController {

    var presenter: PresenterVIPER!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        presenter.showPerson()
    }
}

extension ViewControllerVIPER: ViewControllerProtocolVIPER {
    func showPerson(_ person: PersonMVC) {
        let personView = PersonViewMVC(person: person)
        personView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(personView)
        NSLayoutConstraint.activate([
            personView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            personView.widthAnchor.constraint(equalToConstant: 200),
            personView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
