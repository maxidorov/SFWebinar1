//
//  PresenterMVP.swift
//  ArcPatterns
//
//  Created by Maxim V. Sidorov on 2/21/21.
//

import Foundation

class PresenterMVP {
    weak var viewInput: ViewInputMVP?
}

extension PresenterMVP: ViewOutputMVP {
    func showPerson() {
        let person = PersonMVC(name: "NameMVP")
        viewInput?.showPerson(person)
    }
}
