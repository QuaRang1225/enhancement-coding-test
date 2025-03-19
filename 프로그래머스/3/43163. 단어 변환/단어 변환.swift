import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    func bfs() -> Int {
        var queue = [begin]
        var compare = [begin]
        compare.reserveCapacity(words.count)
        var step = 0
        while !queue.isEmpty {
            let node = queue.removeFirst()
            guard node != target else{ return step }
            for word in words{
                let diff = zip(node, word).filter{ $0 != $1 }.count
                if diff == 1,!compare.contains(word){ 
                    queue.append(word)
                    compare.append(word) 
                }
            }
            step += 1
        }
        return 0
    }
    return bfs()
}