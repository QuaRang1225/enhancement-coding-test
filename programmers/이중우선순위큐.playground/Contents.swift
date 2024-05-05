import Foundation

func solution(_ operations:[String]) -> [Int] {
    
    var operations = operations.map{ $0.components(separatedBy: " ")}.map{ ($0[0],Int($0[1])!)}
    var queue = [Int]()
    
    for (command,value) in operations{
        switch command{
        case "I" : queue.append(value)
        case "D" where value == -1 : 
            guard !queue.isEmpty else {continue}
            queue = queue.filter{ $0 != queue.min() }
        case "D" where value == 1 : queue = queue.filter{ $0 != queue.max() }
        default: break
        }
    }
    guard !queue.isEmpty else {return [0,0]}
    var reuslt = [queue.max()!,queue.min()!]
    return reuslt
}

print(solution(  ["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"] ))
