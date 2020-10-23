//
//  main.swift
//  Webinar4
//
//  Created by Maxim Sidorov on 23.10.2020.
//

import Foundation

struct Struct1 {
    var number = 1
}

var struct1 = Struct1()
print(struct1.number)
struct1.number = 2

var struct2 = struct1
print(struct2.number)


class Class1 {
    var number = 10
}

var class1 = Class1()
print(class1.number)

var class2 = class1
print(class2.number)
class1.number = 20
print(class2.number)



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
    
    init (maxSpeed: Int = 200, fuelInTank: Int = 100, fuelConsumption: Double = 15) {
        self.fuelInTank = fuelInTank
        self.fuelConsumption = fuelConsumption
        super.init(name: "Car", maxSpeed: maxSpeed)
    }
}

let car2 = Car(maxSpeed: 240, fuelInTank: 80, fuelConsumption: 10)
let car3 = Car(fuelInTank: 90, fuelConsumption: 11)
print(car3.powerReserve)

class ElectricScooter: Transport, HasPowerReserve {
    var chargeLevel: Double
    var maxDistance: Double
    
    var powerReserve: Double {
        return maxDistance * chargeLevel / 100
    }
    
    init (maxSpeed: Int = 20, maxDistance: Double = 25, chargeLevel: Double = 100) {
        self.chargeLevel = chargeLevel
        self.maxDistance = maxDistance
        super.init(name: "Electric scooter", maxSpeed: maxSpeed)
    }
}

let electricScooter = ElectricScooter(maxSpeed: 40, chargeLevel: 50)
print(electricScooter.powerReserve)

// Полиморфизм

print("---------------")

protocol HasPowerReserve {
    var powerReserve: Double { get }
}

var transports: [HasPowerReserve] = [car3, electricScooter]

for transport in transports {
    print(transport.powerReserve)
}

// Инкапсуляция

class Plane: Transport {
    init() {
        super.init(name: "Plane", maxSpeed: 1000)
    }
    
    func printMaxSpeedInMiles() {
        let maxSpeedInMiles = kilometersToMiles(km: maxSpeed)
        print("Max speed: \(maxSpeedInMiles) miles per hour")
    }
    
    private func kilometersToMiles(km: Int) -> Double {
        return Double(km) / 1.6
    }
}


let plane = Plane()
plane.printMaxSpeedInMiles()
