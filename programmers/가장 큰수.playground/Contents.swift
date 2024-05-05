import UIKit

func solution(_ numbers:[Int]) -> String {
    let sorted = numbers.sorted { Int("\($0)\($1)")! > Int("\($1)\($0)")! }
    guard sorted[0] != 0 else {return "0"}
    return sorted.map{String($0)}.joined()
}
print(solution([0,0]))
