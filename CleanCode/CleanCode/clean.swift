//
//  clean.swift
//  CleanCode
//
//  Created by Maxim V. Sidorov on 6/24/21.
//

import Foundation

struct Clean1 {

  let variable_one = 1
  let VariableOne = 1
  let Variable_One = 1
  let variableOne = 1 // camel case
}

class Clean2 {
  // структуры или классы
  // свойства (public)
  // свойства (private)
  // init
  // методы (public)
  // методы (private)

  struct Constants {
    static let const1 = 123
  }

  struct Point {
    var x: Int
    var y: Int
  }

  var propertyTwo: Int
  var propertyThree: Int

  private var propertyOne: Int

  init(
    propertyOne: Int,
    propertyTwo: Int,
    propertyThree: Int
  ) {
    self.propertyOne = propertyOne
    self.propertyTwo = propertyTwo
    self.propertyThree = propertyThree
  }

  func f1() {

  }

  // MARK: - to do ...
  private func f2(param: Point) {
    print(param)
    print(Constants.const1)
    print(strSum(str1: nil, str2: nil))
  }

  // FIXME: - fix ...
}

func strSum(str1: String?, str2: String?) -> String? {
//  if let str1 = str1 {
//    if let str2 = str2 {
//      return str1 + str2
//    }
//  }
//  return str2
  guard let str1 = str1,
        let str2 = str2 else { return nil }
  return str1 + str2
}

