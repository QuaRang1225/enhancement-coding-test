import UIKit

func solution(_ numbers:String) -> Int {
    var numbers =  numbers.map { String($0) }
    
    var list = [String]()
    
    func primeNumber(_ num : Int) -> Bool{
        guard num > 1 else { return false }
        for i in 2..<Int(sqrt(Double(num)))+1{
            if num % i == 0 {return false}
        }
        return true
        
    }
    func combination(numberList: [String], current : String) {
        if current != ""{
            list.append(current)
        }
        
        for i in 0..<numberList.count{
            var numberList = numberList
            var newCurrent = numberList.remove(at: i)
            combination(numberList: numberList, current: current + newCurrent)
        }
    }
    combination(numberList: numbers, current: "")
    print(Set(list.compactMap{Int($0)}).filter{primeNumber($0)})
    return Set(list.compactMap{Int($0)}).filter{primeNumber($0)}.count
    
}
print(solution(    "12345"      ))



