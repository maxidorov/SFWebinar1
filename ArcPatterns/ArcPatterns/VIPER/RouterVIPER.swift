//
//  RouterVIPER.swift
//  ArcPatterns
//
//  Created by Maxim V. Sidorov on 2/21/21.
//

import Foundation
import UIKit

protocol RouterProtocolVIPER { }

class RouterVIPER {

    var viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension RouterVIPER: RouterProtocolVIPER { }
