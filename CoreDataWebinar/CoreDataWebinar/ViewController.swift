//
//  ViewController.swift
//  CoreDataWebinar
//
//  Created by Maxim V. Sidorov on 11/7/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  var items: [Person]?

  override func viewDidLoad() {
    super.viewDidLoad()
    fetchPeople()
//    addPerson(name: "Name1")
//    addPerson(name: "Name2")
//    addPerson(name: "Name3")
//    addPerson(name: "Name4")
  }

  func fetchPeople() {
    do {
      items = try context.fetch(Person.fetchRequest())
      print("Current people:", items!.map { $0.name! })
    } catch {
      print(error.localizedDescription)
    }
  }

  func addPerson(name: String) {
    let newPerson = Person(context: context)
    newPerson.name = name
    newPerson.age = 18

    do {
      try context.save()
      print("Person with name \"\(name)\" was added")
    } catch {
      print(error.localizedDescription)
    }
  }
}

