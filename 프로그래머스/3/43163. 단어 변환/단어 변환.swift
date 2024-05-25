import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    func bfs() -> Int {
        var queue: [String] = [begin]
        var compare: [String] = [begin]
        var depth = 0
        while !queue.isEmpty {
            let size = queue.count
            let node = queue.removeLast()
            guard node != target else{ return depth }
            
            (0..<size).forEach { _ in
                words.forEach { word in
                    var diff = 0
                    zip(node, word).forEach { if $0 != $1 { diff += 1 } }
                    if diff == 1 && !compare.contains(word){ 
                        queue.append(word)
                        compare.append(word) 
                    }
                }
            }
            depth += 1
        }
        return 0
    }
    return bfs()
}