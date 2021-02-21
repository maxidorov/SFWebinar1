//
//  InteractorVIPER.swift
//  ArcPatterns
//
//  Created by Maxim V. Sidorov on 2/21/21.
//

import Foundation

protocol InteractorProtocolVIPER {
    func getPerson() -> PersonMVC
}

class InteractorVIPER { }

extension InteractorVIPER: InteractorProtocolVIPER {
    func getPerson() -> PersonMVC {
        let person = PersonMVC(name: "NameVIPER")
        return person
    }
}
