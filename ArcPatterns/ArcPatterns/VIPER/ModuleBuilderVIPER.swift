//
//  ModuleBuilderVIPER.swift
//  ArcPatterns
//
//  Created by Maxim V. Sidorov on 2/21/21.
//

import Foundation
import UIKit

class ModuleBuilderVIPER {
    static func build() -> UIViewController {
        let viewController = ViewControllerVIPER()
        let interactor = InteractorVIPER()
        let router = RouterVIPER(viewController: viewController)
        let presenter = PresenterVIPER(
            viewController: viewController,
            interactor: interactor,
            router: router
        )
        viewController.presenter = presenter
        return viewController
    }
}
