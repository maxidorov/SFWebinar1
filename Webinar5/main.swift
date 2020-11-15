//
//  main.swift
//  Webinar5
//
//  Created by Maxim V. Sidorov on 11/14/20.
//

import Foundation

struct A {
    var number = 1
}

var a1 = A()
var a2 = a1 // копирование
a2.number = 2
print(a1.number)
print(a2.number)

class B {
    var number = 10
}

var b1 = B()
var b2 = b1 // новое имя для ссылки на класс B
b2.number = 20
print(b1.number) // 20
print(b2.number) // 20

print("--------------")

class Transport {
    var name: String
    var maxSpeed: Int
    
    init (name: String, maxSpeed: Int) {
        self.name = name
        self.maxSpeed = maxSpeed
    }
    
    func printName() {
        print(self.name)
    }
}

let car = Transport(name: "Car", maxSpeed: 250)
car.printName()


// Наследование

class Car: Transport, HasPowerReserve {
    var fuelInTank: Int
    var fuelConsumption: Double
    
    var powerReserve: Double {
        return Double(fuelInTank) / fuelConsumption * 100
    }
    
    init (maxSpeed: Int = 250, fuelInTank: Int, fuelConsumption: Double) {
        self.fuelInTank = fuelInTank
        self.fuelConsumption = fuelConsumption
        super.init(name: "Car", maxSpeed: maxSpeed)
    }
}

let car1 = Car(maxSpeed: 250, fuelInTank: 80, fuelConsumption: 10)
let car2 = Car(fuelInTank: 70, fuelConsumption: 15)
print(car2.powerReserve)


class ElectricScooter: Transport, HasPowerReserve {
    var chargeLevel: Double
    var maxDistance: Double
    
    var powerReserve: Double {
        return maxDistance * chargeLevel / 100
    }
    
    init (maxSpeed: Int = 20, chargeLevel: Double = 100, maxDistance: Double = 25) {
        self.chargeLevel = chargeLevel
        self.maxDistance = maxDistance
        super.init(name: "ElectricScooter", maxSpeed: maxSpeed)
    }
}

let electricScooter = ElectricScooter()
print(electricScooter.maxSpeed)
print(electricScooter.chargeLevel)
print(electricScooter.maxDistance)
electricScooter.chargeLevel = 100
print(electricScooter.powerReserve)

class F {
    var num: Int?
}

print(F().num ?? 123)

// Полиморфизм
print("--------------")

protocol HasPowerReserve {
    var powerReserve: Double { get }
}

let transports: [HasPowerReserve] = [car1, electricScooter]

for transport in transports {
    print(transport.powerReserve)
}


protocol HasNum {
    var num: Int { get set }
}

class C: HasNum {
    var num = 1
}

class D: HasNum {
    var num = 2
}


let classes: [HasNum] = [C(), D()]

for c in classes {
    print(c.num)
}


// Инкапсуляция

class Plane: Transport {
    init() {
        super.init(name: "Plane", maxSpeed: 1000)
    }
    
    func printMaxSpeedInMiles() {
        let speedInMiles = kilometersToMiles(km: maxSpeed)
        print("Max speed: \(speedInMiles) miles per hour")
    }
    
    private func kilometersToMiles(km: Int) -> Double {
        return Double(km) / 1.6
    }
}

let plane = Plane()
plane.printMaxSpeedInMiles()
