//
//  main.swift
//  webinar
//
//  Created by Maxim V. Sidorov on 1/17/21.
//

import Foundation

/*

 func name(params) -> type {
    //....
    return ...
 }

 func name(params) {

 }

 func name() -> type {
     //....
     return ...
     print(..
 }

 func name() {

 }

 */

// () -> ()
func myFunc() {
    print("Hello")
}

// (String) -> ()
func myFunc2(str: String) {
    print(str)
}

myFunc2(str: "Hello")

// (String) -> ()
func myFunc3(_ str: String) {
    print(str)
}

myFunc3("Hello")

// (Int, Int) -> Int
func summ(_ a: Int, _ b: Int) -> Int {
    return a + b
}

print(summ(3, 5))

// (Int) -> Bool
func greaterThanZero(_ num: Int) -> Bool {
    if num > 0 {
        return true
    } else {
        return false
    }
}

func greaterThanZero2(_ num: Int) -> Bool {
    return num > 0
}

var x = 10

func plusOne(a: inout Int) {
    a += 1
}

plusOne(a: &x)

print(x)


func summ2(_ numbers: Double...) -> Double {
    var s: Double = 0
    for num in numbers {
        s += num
    }
    return s
}

print(summ2(1, 2, 3, 4.5))
print(summ2(1))

// () -> (Int, Int)
func f3() -> (Int, Int) {
    return (1, 2)
}

// Замыкания

func f4() -> (Int, Int) -> Int {
    return summ
}

print(f4()(10, 5))
var f = f4()
print(f(20, 30))

func f6(_ n1: Int) -> (Int) -> (Int) -> Int {
    return { n2 in
        return { n3 in
            return n1 + n2 + n3
        }
    }
}

print(f6(10)(5)(3))

func f8() -> (Int, Bool, Double, String) {
    return (50, false, 0.5, "text")
}

let b = f8()
print(b.0, b.1, b.2, b.3)
print(b)

func f9() -> (one: Int, two: Bool, three: Double, four: String) {
    return (50, false, 0.5, "text")
}

print(f9().three)


let printHello: () -> Void = {
    print("Hello")
}

printHello()

let printNumber: (Int) -> Void = { number in
    print(number)
}

printNumber(123)

let printNumber2: (Int) -> Void = {
    print($0)
}

printNumber2(1234)

let printNumbers: (Int, Int, Int) -> Void = {
    print($0, $1, $2)
}

printNumbers(1,2,3)

var numbers = [15,63,62,87,40,20,4]

print(numbers.sorted())
print(numbers.sorted(by: { $0 % 10 < $1 % 10 }))

func loadText(url: String, completion: @escaping (String) -> Void) {
    //...
    var loadedText = "loaded text ..."
    completion(loadedText)
}

loadText(url: "https://....") { text in
    print(text)
}

print(123)
