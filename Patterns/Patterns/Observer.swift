//
//  Observer.swift
//  Patterns
//
//  Created by Maxim V. Sidorov on 2/7/21.
//

import Foundation

protocol Observable {
    func add(observer: Observer)
    func remove(observer: Observer)
    func notifyObservers()
}

protocol Observer {
    var id: String { get set }
    func update(value: Int?)
}

final class NewsResource: Observable {

    var value: Int? {
        didSet {
            notifyObservers()
        }
    }

    private var observers: [Observer] = []

    func add(observer: Observer) {
        observers.append(observer)
    }

    func remove(observer: Observer) {
        guard let index = observers.enumerated().first(where: { $0.element.id == observer.id})?.offset else { return }
        observers.remove(at: index)
    }

    func notifyObservers() {
        observers.forEach { $0.update(value: value) }
    }
}

final class NewsAgency: Observer {
    var id: String = "NewsAgency"

    func update(value: Int?) {
        guard let value = value else { return }
        print("News Agency. New article about value: \(value)")
    }
}

final class Reporter: Observer {
    var id = "Reporter"

    func update(value: Int?) {
        guard let value = value else { return }
        print("Reporter. New article about value: \(value)")
    }
}

final class Blogger: Observer {
    var id = "Blogger"

    func update(value: Int?) {
        guard let value = value else { return }
        print("Blogger. New article about value: \(value)")
    }
}
