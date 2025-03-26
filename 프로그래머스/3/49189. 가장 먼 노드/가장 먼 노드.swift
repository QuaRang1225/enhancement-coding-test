import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = [Int:[Int]]()
    var visited = [Int](repeating:-1,count:n + 1)
    var queue = [1]
    
    for i in edge{
        graph[i[0],default:[]].append(i[1])
        graph[i[1],default:[]].append(i[0])
    }
    visited[1] = 0
    while !queue.isEmpty{
        let node = queue.removeFirst()
        for i in graph[node, default: []]{
            if visited[i] == -1{
                queue.append(i)
                visited[i] = visited[node] + 1
            }
        }
    }
    let max = visited.max()!
    return visited.filter{ $0 == max }.count
}