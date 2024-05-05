import Foundation
var inputLines: [Int] = []
func cantor(num: Double) -> String {
    guard num > 0 else {return "-"}
    let cantor = cantor(num: num-1)
    return cantor + String(repeating: " ", count: Int(pow(3,num-1))) + cantor
}
while let line = readLine(), let num = Double(line) {  print(cantor(num: num)) }
