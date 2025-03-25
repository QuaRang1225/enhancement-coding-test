import Foundation

func solution(_ operations:[String]) -> [Int] {
    
    var operations = operations.map{ $0.components(separatedBy: " ")}.map{ ($0[0],Int($0[1])!)}
    var queue = Set<Int>()
    
    for (command,value) in operations{
        switch command{
        case "I" : queue.insert(value)
        case "D" where value == -1 && !queue.isEmpty :
            // queue.sort(by:>)
            // queue.removeLast()
            queue.remove(queue.min()!)
        case "D" where value == 1 && !queue.isEmpty: 
            // queue.sort(by:<)
            // queue.removeLast()
            queue.remove(queue.max()!)
        default: break
        }
    }
    guard !queue.isEmpty else { return [0,0] }
    return [queue.max()!,queue.min()!]
}