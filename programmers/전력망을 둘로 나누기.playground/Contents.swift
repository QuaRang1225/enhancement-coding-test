import UIKit

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    
    var graph = [Int:[Int]]()
    wires.forEach { graph[$0[0],default: []].append($0[1])}
    wires.forEach { graph[$0[1],default: []].append($0[0])}
    
    var visited = [Bool](repeating: false, count: n+1)
    
    func bfs(_ start: Int) -> Int{
        var queue = [start]
        var index = 0
        
        while !queue.isEmpty{
            let first = queue.removeFirst()
            index += 1
            if !visited[first]{ visited[first] = true }
            for node in graph[first]!{
                if !visited[node]{
                    queue.append(node)
                    visited[node] = true
                }
            }
        }
        return index
        
    }

    return (1...n).map{
        visited = [Bool](repeating: false, count: n+1)
        visited[$0] = true
         let cnt = bfs(1)
        return (abs(cnt-(n-cnt)))
     }.min()!
}

print(solution(9,    [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]]  ))
