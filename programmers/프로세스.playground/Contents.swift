import UIKit

func solution(_ priorities:[Int], _ location:Int) -> Int {
    

    var queue = priorities.enumerated().map{($0,$1)}
    var sortedQueue = [(Int,Int)]()
    
    while !queue.isEmpty{
        for (index,value) in queue{
            if let max = queue.map({$0.1}).max(),value == max{
                queue.removeFirst()
                sortedQueue.append((index,value))
            }else{
                queue.append(queue.removeFirst())
            }
        }
    }
    return (sortedQueue.firstIndex(where: {$0.0 == location}) ?? 0) + 1
}

//func solution(_ priorities:[Int], _ location:Int) -> Int {
//    var priority: [(Int,Int)] = priorities.enumerated().map {($0.offset, $0.element)}
//    var printing: Int = 0
//
//    while true {
//        print(priority)
//        let pri: (Int, Int) = priority.remove(at: 0)
//        
//        if !priority.filter({pri.1 < $0.1}).isEmpty {
//            priority.append(pri)
//        } else if pri.0 == location {
//            
//            printing = priorities.count - priority.count
//            break
//        }
//    }
//
//    return printing
//}
print(solution(  [1, 1, 9, 1, 1, 1]    , 0))
