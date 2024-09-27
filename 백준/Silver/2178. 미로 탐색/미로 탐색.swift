let input = readLine()!.split(separator: " ").compactMap{Int($0)}
    let (m,n) = (input[0],input[1])
    
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    var arr = [[Int]]()
    var queue = [[0,0]]
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
    var distance = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
    
    visited[0][0] = true
    distance[0][0] = 1
    
    for _ in 0..<m{
        arr.append(readLine()!.compactMap{Int(String($0))})
    }
    
    while !queue.isEmpty{
        let node = queue.removeFirst()
        for k in 0..<4{
            let nx = dx[k] + node[1]
            let ny = dy[k] + node[0]
            if (0..<n)~=nx,(0..<m)~=ny,arr[ny][nx] == 1,!visited[ny][nx]{
                distance[ny][nx] = distance[node[0]][node[1]] + 1
                visited[ny][nx] = true
                queue.append([ny,nx])
            }
        }
    }
    print(distance[m-1][n-1])