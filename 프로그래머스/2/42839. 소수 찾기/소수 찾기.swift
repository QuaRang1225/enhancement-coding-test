import Foundation

func solution(_ numbers:String) -> Int {
   
    var numbers = numbers.map{String($0)}
    var numArr = [String]()
    
    //조합의 수 함수
    func combin(numbers:[String],num:String){
        if num != ""{ numArr.append(num)}
        for i in 0..<numbers.count{
            var numbers = numbers
            let node = numbers.remove(at: i)
            combin(numbers: numbers, num: num + node)
        }
        
    }
    //소수 찾기
    func isPrime(num:Int) -> Bool{
        guard num > 1 else{return false}
        for i in 2..<Int(sqrt(Double(num))+1){
            if num % i == 0{ return false }
        }
        return true
    }
    
    combin(numbers: numbers, num: "")
    
    
    
    return Set(numArr.compactMap{Int($0)}).filter{isPrime(num: $0)}.count
}