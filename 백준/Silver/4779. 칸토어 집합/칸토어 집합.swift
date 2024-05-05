import Foundation

var inputLines: [Int] = []
func cantor(num: Double) -> String {
    guard num != 0 else {return "-"}
    let divisible = cantor(num: num-1)
    return divisible + String(repeating: " ", count: Int(pow(3,num-1))) + divisible
}

while let line = readLine(), let num = Double(line) {  print(cantor(num: num)) }
