//
//  main.swift
//  Webinar6 Helper
//
//  Created by Maxim V. Sidorov on 11/15/20.
//

import Foundation

// Протоколы
 
protocol TeacherProtocol: class {
    var students: [StudentProtocol & HasName] { get set }
}

protocol StudentProtocol: class {
    var teacher: (TeacherProtocol & HasName)? { get set }
}

protocol HasName: class {
    var name: String { get }
}

extension HasName {
    func greeting() -> String {
        return "Hi, I am \(name)!"
    }
}


class Student: StudentProtocol, HasName {
    weak var teacher: (TeacherProtocol & HasName)?
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Teacher: TeacherProtocol, HasName {
    var students: [StudentProtocol & HasName]
    var name: String
    
    init(name: String, students: [StudentProtocol & HasName]) {
        self.name = name
        self.students = students
    }
}

let student1 = Student(name: "Vasya")
let student2 = Student(name: "Petya")
let student3 = Student(name: "Kolya")

let group: [StudentProtocol & HasName] = [student1, student2, student3]

let teacher: (TeacherProtocol & HasName) = Teacher(name: "Misha", students: group)

group.forEach { (student) in
    student.teacher = teacher
}

print(student1.teacher?.name ?? "student1 has not teacher")
print(student2.teacher?.name ?? "student2 has not teacher")
print(student3.teacher?.name ?? "student3 has not teacher")


for (i, student) in teacher.students.enumerated() {
    print("Name of the student\(i + 1) is \(student.name)")
}

print(student1.greeting())
print(teacher.greeting())


print("---------------------")
// Исключения

enum ATMError: String, LocalizedError {
    case notEnoughCash = "Not enough cash"
    case notEnoughDeposit = "Not enough deposit"
    case incorrectPin = "Incorrect pin"
    
    var errorDescription: String? {
        return self.rawValue.replacingOccurrences(of: " ", with: "_").uppercased()
    }
}

class ATM {
    func makeOperation(pin: String) throws -> Bool {
        if pin == "1234" {
            return true
        }
        throw ATMError.incorrectPin
    }
}

let atm = ATM()
var success: Bool = false

do {
    try success = atm.makeOperation(pin: "1235")
} catch {
    if let error = error as? LocalizedError {
        print("Error: \(error.errorDescription ?? "no description")")
    }
}

if success {
    print("Operation complete!")
}

print("---------------------")
// Generics


func sum(_ a: Int, _ b: Int) -> Int {
    return a + b
}

print(sum(3, 5))
//print(sum(3, 5.0)) // ошибка


func sumNumeric<T: Numeric>(_ a: T, _ b: T) -> T {
    return a + b
}

let c = sumNumeric(0.1, 2)
print(c)


protocol HasId {
    var id: Int { get }
}

enum Color {
    case red
    case green
    case blue
}

class Item: HasId {
    let id: Int
    let color: Color
    
    init(id: Int, color: Color) {
        self.id = id
        self.color = color
    }
}

let item1 = Item(id: 1, color: .red)
let item2 = Item(id: 2, color: .green)
let item3 = Item(id: 2, color: .blue)


func equal<T: HasId>(_ item1: T, _ item2: T) -> Bool {
    return item1.id == item2.id
}

print(equal(item1, item2))
print(equal(item1, item3))
print(equal(item2, item3))




































