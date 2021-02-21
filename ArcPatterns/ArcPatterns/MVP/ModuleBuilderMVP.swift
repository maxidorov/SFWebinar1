//
//  ModuleBuilderMVP.swift
//  ArcPatterns
//
//  Created by Maxim V. Sidorov on 2/21/21.
//

import Foundation
import UIKit

class ModuleBuilderMVP {
    static func build() -> UIViewController {
        let presenter = PresenterMVP()
        let viewController = ViewControllerMVP(output: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
