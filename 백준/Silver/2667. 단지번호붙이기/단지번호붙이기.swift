let n = Int(readLine()!)!
    var arr = [[Int]]()
    
    (0..<n).forEach{ _ in arr.append(readLine()!.compactMap{Int(String($0))}) }
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    
    var ports = [Int]()
    
    for i in 0..<n{
        for j in arr[i].indices{
            guard arr[i][j] == 1,!visited[i][j] else{ continue }
            var port = 1
            visited[i][j] = true
            var queue = [[i,j]]
            while !queue.isEmpty{
                let node = queue.removeFirst()
                for k in 0..<4{
                    let nx = dx[k] + node[1]
                    let ny = dy[k] + node[0]
                    if (0..<n)~=ny,(0..<n)~=nx,!visited[ny][nx],arr[ny][nx] == 1{
                        visited[ny][nx] = true
                        queue.append([ny,nx])
                        port += 1
                    }
                }
            }
            ports.append(port)
        }
    }
    print(ports.count)
    ports.sorted().map{ print($0) }