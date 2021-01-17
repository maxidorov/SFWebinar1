//
//  main.swift
//  Webinar6
//
//  Created by Maxim V. Sidorov on 11/15/20.
//

import Foundation

// Протоколы

protocol TeacherProtocol: class {
    var students: [StudentProtocol] { get set }
}

protocol StudentProtocol: class {
    var teacher: TeacherProtocol? { get set }
}

protocol HasName {
    var name: String { get set }
}

extension HasName {
    func greeting() -> String {
        return "Hello, I am \(name)"
    }
}

class Teacher: TeacherProtocol, HasName {
    var students: [StudentProtocol]
    var name: String
    
    init(name: String, students: [StudentProtocol]) {
        self.name = name
        self.students = students
    }
}

class Student: StudentProtocol, HasName {
    weak var teacher: TeacherProtocol?
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


let student1 = Student(name: "Vasya")
let student2 = Student(name: "Petya")
let student3 = Student(name: "Kolya")


let group = [student1, student2, student3]

let teacher = Teacher(name: "Ivan", students: group)

print(student1.teacher) // nil

group.forEach { student in
    student.teacher = teacher
}

print(student1.teacher) // не nil

group.forEach { student in
    print(student.name)
}

print(teacher.name)

let persons: [HasName] = [teacher, student1, student2, student3]

print("------------")

persons.forEach { person in
    print(person.greeting())
}


protocol Hello { }
extension Hello {
    func hello() {
        print("hello")
    }
}

class A: Hello { }
let a = A()
a.hello()


// Исключения
print("------------")


enum ATMError: String, LocalizedError {
    case notEnoughCash = "Not enough cash"
    case notEnoughDeposit = "Not enough deposit"
    case incorrectPin = "Incorrect pin"
    
    var errorDescription: String? {
        return self.rawValue
    }
}

class ATM {
    func makeOperation(pin: String) throws -> Bool {
        if pin == "1234" { // проверка
            // ....
            return true
        }
        throw ATMError.incorrectPin
//        return false
    }
}

let atm = ATM()
var success: Bool = false

do {
    //...
    try success = atm.makeOperation(pin: "1235")
} catch {
    if let error = error as? ATMError {
        switch error {
        case .incorrectPin:
            print("YOU PIN CODE IS INCORRECT")
            print(error.errorDescription ?? "nil")
        case .notEnoughCash:
            print(error.errorDescription ?? "nil")
        case .notEnoughDeposit:
        print(error.errorDescription ?? "nil")
        }
    }
}

if success {
    print("Operation completed")
}

// Generic
print("------------")

func sum(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func sum(_ a: Int, _ b: Double) -> Double {
    return Double(a) + b
}

func sum(_ a: Double, _ b: Int) -> Double {
    return a + Double(b)
}

print(sum(1, 2))
print(sum(1, 5.5))
print(sum(1.5, 5))


func sumNumbers<T: Numeric>(_ a: T, _ b: T) -> T {
    return a + b
}

print(sumNumbers(1, 2))
print(sumNumbers(1.5, 2))
print(sumNumbers(1, 2.5))

func equal<T: Equatable>(_ a: T, _ b: T) -> Bool {
    return a == b
}

print(equal(1.1, 1))
print(equal(1, 2))
print(equal("str", "string"))


enum Color {
    case req
    case green
    case blue
}

protocol HasId {
    var id: Int { get set }
}

class Tshirt: HasId {
    var id: Int
    var color: Color
    
    init(id: Int, color: Color) {
        self.id = id
        self.color = color
    }
}


let item1 = Tshirt(id: 1, color: .blue)
let item2 = Tshirt(id: 2, color: .green)
let item3 = Tshirt(id: 2, color: .req)

func equalTshirts(_ a: Tshirt, _ b: Tshirt) -> Bool {
    return a.id == b.id
}

print("------------")
print(equalTshirts(item1, item2))
print(equalTshirts(item1, item3))
print(equalTshirts(item2, item3))


func equalItems<T: HasId>(_ a: T, _ b: T) -> Bool {
    return a.id == b.id
}

print("------------")
print(equalItems(item1, item2))
print(equalItems(item1, item3))
print(equalItems(item2, item3))


func == (_ a: HasId, _ b: HasId) -> Bool {
    return a.id == b.id
}

print("------------")
print(item1 == item2)
print(item1 == item3)
print(item2 == item3)
