//
//  main.swift
//  Webinar3
//
//  Created by Maxim Sidorov on 08.10.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import Foundation

print(1)
print(1)
print(1)
print(1)
print(1)

for _ in 1...10 {
    print(2)
}

for number in 20...25 {
    print(number)
}

var numbers = [1,2,3,4]

for var num in numbers {
    num *= 10
    print(num)
}

let swift = "Swift"

for char in swift {
    print(char)
}



/*
 
 func имя_функции(параметры) -> тип_возвращаемого_значения {
    ...
    return значение
 }
 
 func имя_функции(параметры) {
    ...
 }
 
 func имя_функции() -> Void {
    ...
 }
 
 func имя_функции() {
    ...
 }
 
 func имя_функции() -> тип_возвращаемого_значения {
    ...
    return значение
 }
 
 */

func myFunc1() {
    print("Hello")
}
myFunc1()

func myFunc2(str: String) {
    print(str)
}
myFunc2(str: "Hello2")

func summ(_ num1: Int, _ num2: Int) {
    print(num1 + num2)
}

summ(4, 5)

func isTen(num: Int) -> Bool {
    if num == 10 {
        return true
    } else {
        return false
    }
}


var is10 = isTen(num: 10)


// inout

func plusOne(num: inout Int) {
    num += 1 // num = num + 1
}

var one = 1
print(one)
plusOne(num: &one)

func plusTwo(to num: inout Int) {
    num += 2
}

//var s = 0.1
//plusTwo(to: &s)

func sayHello(to name: String) {
    print("Hello" + " " + name)
    print("Hello " + name)
    print("Hello \(name)")
}

sayHello(to: "Swift")

func getMax(numbers: Double...) {
    for num in numbers {
        print(num)
    }
}

getMax(numbers: 1.1, 0.8, 1.5)

func f4() -> (Int, Int) -> Int {
    return {
        return $0 + $1
    }
}

func f5() -> (Int, Int) -> Int {
    func summ(a: Int, b: Int) -> Int {
        return a + b
    }
    return summ
}


func f6(_ n1: Int) -> (Int) -> (Int) -> Int {
    return { n2 in
        return { n3 in
            return n1 + n2 + n3
        }
    }
}

print(f6(3)(4)(5))

func f7(n1: Int, n2: Int, closure: (Int, Int) -> Int) -> Int{
    return closure(n1, n2)
}

print(f7(n1: 3, n2: 4) { return $0 + $1 })


class Car {
    func myFunc3(name: String) {
        print("Hello \(name)")
    }
}

let car = Car()
car.myFunc3(name: "Car")
