import UIKit

let queue1 = DispatchQueue.global(qos: .userInteractive)
let queue2 = DispatchQueue.global(qos: .userInitiated)
let queue3 = DispatchQueue.global(qos: .utility)
let queue4 = DispatchQueue.global(qos: .background)
let queue5 = DispatchQueue.global(qos: .default)

let queue = DispatchQueue.global()

//queue.sync {
//  print(1)
//  sleep(3)
//  print(2)
//}
//
//print(3)

//queue.async {
//  print(1)
//  sleep(3)
//  print(2)
//}
//
//print(3)


//queue.async {
//  print(1)
//}
//print(2)

//let serialQueue = DispatchQueue(
//  label: "serialQueue",
//  qos: .default
//)
//
//let concurrentQueue = DispatchQueue(
//  label: "concurrentQueue",
//  qos: .default,
//  attributes: .concurrent
//)

//serialQueue.async {
//  sleep(1)
//  print(1)
//}
//
//serialQueue.async {
//  sleep(1)
//  print(2)
//}
//
//serialQueue.async {
//  sleep(1)
//  print(3)
//}

//concurrentQueue.async {
//  sleep(1)
//  print(1)
//}
//
//concurrentQueue.async {
//  sleep(1)
//  print(2)
//}
//
//concurrentQueue.async {
//  sleep(1)
//  print(3)
//}


let serialQueue = DispatchQueue(label: "barrier")

//var result = "empty"
//serialQueue.async {
//  sleep(1)
//  result = "some text"
//}
//print(result)

var result = "empty"
serialQueue.async {
  sleep(1)
  result = "some text"
}
serialQueue.async(flags: .barrier) {
  print(result)
}
print(".......")
