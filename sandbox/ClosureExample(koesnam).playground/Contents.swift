import UIKit

//var greeting = "Hello, playground"

func inputIntAndDouble(intValue: Int, doubleValue: Double) -> Int {
    
    return intValue * Int(doubleValue)
}

let convertToInt: (Int, Double) -> Int = inputIntAndDouble
convertToInt(2, 2.0)

func inputStringArray(stringArray: [String]) -> Int {
    var total = 0
    
    for str in stringArray {
        if let intValue = Int(str) {
            total += intValue
        }
    }
    
    return total
}

let convertToSum: ([String]) -> Int = inputStringArray
convertToSum(["7","2","11"])

func arrayToDic(key: String, value: Int) -> [String : Int] {
    var tempDic = [String:Int]()
    tempDic[key] = value
    
    return tempDic
}

let convertToDic: (String,Int) -> [String: Int] = arrayToDic

convertToDic("key",7)




// closure 축약

let shortConvertToInt : (Int, Double) -> Int = { $0 * Int($1) }
shortConvertToInt(2,2.0)

let shortConvertToSum : ([String]) -> Int = { stringArray in
    var total = 0
    
    for str in stringArray {
        if let intValue = Int(str) {
            total += intValue
        }
    }
    
    return total
    
}

let shortConvertToSum2 : ([String]) -> Int = { $0.count }

shortConvertToSum2(["@","1","!2","325"])


shortConvertToSum(["7","3"])

let shortConvertToDic: (String,Int) -> [String: Int] = { [$0 : $1] }

shortConvertToDic("man",5)
 

