import UIKit

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let all = (brown + yellow)
    var multiple = [[Int]]()
    for i in (2..<(Int(sqrt(Double(all))) + 1)).reversed(){
        if (i*2) + ((all/i - 2) * 2) == brown{
            return [all/i,i]
        }
    }
    return []
}

print(solution(8, 1))
