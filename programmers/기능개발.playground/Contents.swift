import UIKit

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var progress = zip(progresses, speeds).map{Int(ceil((Double(100 - $0.0)/Double($0.1))))}
    var result = [Int]()
    var task = 0
    
    progress.forEach { day in
        if day > task{
            task = day
            result.append(1)
        }else{
            result[result.count - 1] += 1
        }
    }
    return result
}

print(solution(       [95, 90, 99, 99, 80, 99]   ,   [1, 1, 1, 1, 1, 1]   ))
