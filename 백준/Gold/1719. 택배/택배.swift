let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]
    var graph = [[(Int, Int)]](repeating: [], count: n + 1)

    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ").map { Int($0)! }
        graph[edge[0]].append((edge[2], edge[1]))
        graph[edge[1]].append((edge[2], edge[0]))
    }

    for i in 1...n {
        dijkstra(start: i, n: n, graph: graph)
    }
    func dijkstra(start: Int, n: Int, graph: [[(Int, Int)]]) {
        var parents = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            parents[i] = i
        }
        var distance = [Int](repeating: 10001, count: n + 1)
        distance[start] = 0
        
        var pq = [(Int, Int)]()
        pq.append((0, start))
        
        while !pq.isEmpty {
            pq.sort { $0.0 > $1.0 }
            let (currCost, currPos) = pq.removeLast()
            
            if distance[currPos] < currCost {
                continue
            }
            
            for next in graph[currPos] {
                let (nextCost, nextPos) = next
                if currCost + nextCost < distance[nextPos] {
                    pq.append((currCost + nextCost, nextPos))
                    distance[nextPos] = currCost + nextCost
                    parents[nextPos] = currPos
                }
            }
        }
        
        for i in 1...n {
            if i == start {
                print("-", terminator: " ")
            } else {
                var curr = i
                while parents[curr] != start {
                    curr = parents[curr]
                }
                print(curr, terminator: " ")
            }
        }
        print()
    }