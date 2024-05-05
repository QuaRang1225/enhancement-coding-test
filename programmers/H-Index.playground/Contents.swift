import UIKit

func solution(_ citations:[Int]) -> Int {

    for (index,value) in citations.sorted(by: >).enumerated() {
        if index >= value {
            return index
        }
    }
    return citations.count
}

print(solution(    [6, 6, 6, 6, 6, 6]      ))
