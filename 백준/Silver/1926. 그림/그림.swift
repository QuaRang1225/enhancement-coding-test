let input = readLine()!.split(separator: " ").compactMap{Int($0)}
    let (y,x) = (input[0],input[1])
    var cnt = 0
    var size = 0
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    var arr:[[Int]] = []
    for _ in 0..<y{
        arr.append(readLine()!.split(separator: " ").compactMap{Int($0)})
    }
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: x), count: y)
    var queue = [[Int]]()
    for i in 0..<y{
        for j in arr[i].indices{
            if !visited[i][j],arr[i][j] == 1{
                queue.append([i,j])
                visited[i][j] = true
                var s = 1
                while !queue.isEmpty{
                    let node = queue.removeFirst()
                    for k in 0..<4{
                        let cx = dx[k] + node[1]
                        let cy = dy[k] + node[0]
                        if cy >= 0 && cy < y,cx >= 0 && cx < x,arr[cy][cx] == 1,!visited[cy][cx]{
                            queue.append([cy,cx])
                            visited[cy][cx] = true
                            s += 1
                        }
                    }
                }
                size = max(s, size)
                cnt += 1
            }
        }
    }
    print(cnt)
    print(size)