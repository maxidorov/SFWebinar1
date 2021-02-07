//
//  Singletone.swift
//  Patterns
//
//  Created by Maxim V. Sidorov on 2/7/21.
//

import Foundation

class Singleton {
    static let shared = Singleton()
    private init() { }

    var value: Int = 0

    func f() {
        print("Hello")
    }
}
