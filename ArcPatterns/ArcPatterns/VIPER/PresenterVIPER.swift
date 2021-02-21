//
//  PresenterVIPER.swift
//  ArcPatterns
//
//  Created by Maxim V. Sidorov on 2/21/21.
//

import Foundation

protocol PresenterProtocolVIPER {
    func showPerson()
}

class PresenterVIPER {

    weak var viewController: ViewControllerProtocolVIPER?
    var interactor: InteractorProtocolVIPER
    var router: RouterProtocolVIPER

    init(
        viewController: ViewControllerProtocolVIPER,
        interactor: InteractorProtocolVIPER,
        router: RouterProtocolVIPER
    ) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
    }
}

extension PresenterVIPER: PresenterProtocolVIPER {
    func showPerson() {
        let person = interactor.getPerson()
        viewController?.showPerson(person)
    }
}
