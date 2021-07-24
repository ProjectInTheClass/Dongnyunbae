import UIKit

func sayHello() {
    print("Hello")
}

let fn1: () -> () = sayHello
fn1()

func addTwoNum(arg1: Double, arg2: Double) -> Double {
    return arg1 + arg2
}

let fn2: (Double, Double) -> Double = addTwoNum

func multiTwoNum(arg1: Int, arg2: Double) -> Int {
    return arg1 * Int(arg2)
}
let fn3: (Int, Double) -> Int = multiTwoNum
fn3(3, 3.14)

func countString(arg5: [String]) -> Int {
    let count1 = arg5.count
    return count1
}
countString(arg5: ["Hello","Bye"])

func listStringAndInt(arg3: String, arg4: Int) -> [String: Int] {
    return [arg3: arg4]
}
let fn5: (String, Int) -> [String: Int] = listStringAndInt
fn5("Horse", 4)