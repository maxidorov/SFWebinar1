import UIKit

let queue1 = DispatchQueue.global(qos: .userInteractive) // 4 max
let queue2 = DispatchQueue.global(qos: .userInitiated) // 3
let queue3 = DispatchQueue.global(qos: .utility) // 2
let queue4 = DispatchQueue.global(qos: .background) // 1 min
let queue5 = DispatchQueue.global(qos: .default) // 2.5

let queue = DispatchQueue.global() // qos: default

//queue.sync {
//  print(1)
//  sleep(3)
//  print(2)
//}
//
//print(3) // main queue

//queue.async {
//  print(1)
//  sleep(3)
//  print(2)
//}
//print(3) // main queue

//queue.async {
//  print(1)
//}
//print(2)

//let serialQueue = DispatchQueue(
//  label: "Serial Queue",
//  qos: .default
//)
//
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

//let concurrentQueue = DispatchQueue(
//  label: "Concurrent Queue",
//  qos: .default,
//  attributes: .concurrent
//)
//
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

let serialQueue = DispatchQueue(label: "queue")

//var result = "empty"
//serialQueue.async {
//  sleep(1) // loading...
//  result = "some text"
//}
//print(result)

var result = "empty"
serialQueue.async {
  sleep(1) // loading...
  result = "some text"
}

serialQueue.async(flags: .barrier) {
  print(result)
}
print("....")
