//
//  main.swift
//  Patterns
//
//  Created by Maxim V. Sidorov on 2/7/21.
//

import Foundation

var firstObject = Singleton.shared
//var secondObject = Singleton()
var secondObject = Singleton.shared

firstObject.value = 1
secondObject.value = 2

print(firstObject.value)
print(secondObject.value)

print(firstObject === secondObject)

print("------------")

let machine = Machine()
let manager = RequestManager()

if !manager.isConnected {
    manager.connectToTerminal()
}

if manager.getStatusRequest(for: machine) == .ready {
    print("Machine is ready")
    manager.sendStartRequest(for: machine)
}

print("------------")

let facade = ConcreteFacade()
facade.startMachine()

print("------------")

let newsResource = NewsResource()
let newsAgency = NewsAgency()
let reporter = Reporter()
let blogger = Blogger()

newsResource.add(observer: newsAgency)
newsResource.add(observer: reporter)
newsResource.value = 10
newsResource.value = 11
newsResource.add(observer: blogger)
newsResource.value = 12
newsResource.remove(observer: newsAgency)
newsResource.value = nil
