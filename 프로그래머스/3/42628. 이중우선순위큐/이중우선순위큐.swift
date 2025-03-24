import Foundation

func solution(_ operations:[String]) -> [Int] {
    
    var operations = operations.map{ $0.components(separatedBy: " ")}.map{ ($0[0],Int($0[1])!)}
    var queue = [Int]()
    for (command,value) in operations{
        switch command{
        case "I" : queue.append(value)
        case "D" where value == -1 && !queue.isEmpty : queue = remove(.min,queue)
        case "D" where value == 1 : queue = remove(.max,queue)
        default: break
        }
    }
    guard !queue.isEmpty else { return [0,0] }
    return [queue.max()!,queue.min()!]
}
enum Mode{
    case min
    case max
}
func remove(_ mode:Mode,_ arr:[Int])->[Int]{
    guard !arr.isEmpty else { return [] }
    var arr = arr
    let data = (mode == .min ? arr.min()! : arr.max()!)
    let index = arr.firstIndex(of:data)!
    arr.remove(at:index)
    return arr
}