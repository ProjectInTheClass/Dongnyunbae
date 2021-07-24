import UIKit

// reference 
func addTwoNum1(arg1: Double, arg2: Double) -> Double {
    return arg1 + arg2
}

let fn1: (Double, Double) -> Double = {
    (arg1: Double, arg2: Double) -> Double
    in
    return arg1 + arg2
}
print(fn1(1,2))

let fn223:(Double, Double) -> Double = {
    $0 + $1      // 리턴 값한줄이면 리턴 생략 가능.
    // 다 생략 가능하지만 arg없기때문에 $로 사용.
}

print(fn223(3,4))


// handmade example

func addTwoNum(arg1: Double, arg2: Double) -> Double {
    return arg1 + arg2
}

let fn2: (Double, Double) -> Double = {
    $0 + $1
}
print(fn2(3.14, 2.45))

func multiTwoNum(arg1: Int, arg2: Double) -> Int {
    return arg1 * Int(arg2)
}
let fn3: (Int, Double) -> Int = {
    $0 * Int($1)

}
print(fn3(3, 3.14))

func countString(arg5: [String]) -> [String] {
    return arg5
}
    
let fn4: ([String]) -> Int = {
    $0.count
}
print(fn4(["Hello", "Bye"]))
    
func listStringAndInt(arg3: String, arg4: Int) -> [String: Int] {
    return [arg3: arg4]
}
    
let fn5: (String, Int) -> [String: Int] = {
    [$0:$1]
}
print(fn5("Horse", 4))