func fire() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (y, x) = (input[0], input[1])
    
    var j = [Int]()
    var f = [[Int]]()
    
    var arr = [[String]]()
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    (0..<y).forEach { i in
        let line = readLine()!.compactMap { String($0) }
        arr.append(line)
        if let index = line.firstIndex(of: "J") { j = [i, index] }
        f.append(contentsOf: line.enumerated().filter { $0.element == "F" }.map { [i, $0.offset] })
    }
    
    if j[0] == 0 || j[0] == y - 1 || j[1] == 0 || j[1] == x - 1 {
        print(1)
        return
    }
    
    var visitedJ = [[Bool]](repeating: [Bool](repeating: false, count: x), count: y)
    var visitedF = [[Bool]](repeating: [Bool](repeating: false, count: x), count: y)
    
    var jQueue = [j]
    var fQueue = f
    
    var cnt = 0
    
    while !jQueue.isEmpty {
        cnt += 1
        
        // 불 확산 처리
        var fnum = fQueue.count
        while fnum > 0 {
            let node = fQueue.removeFirst()
            for i in 0..<4 {
                let ny = node[0] + dy[i]
                let nx = node[1] + dx[i]
                if (0..<x) ~= nx, (0..<y) ~= ny, arr[ny][nx] == ".", !visitedF[ny][nx] {
                    visitedF[ny][nx] = true
                    fQueue.append([ny, nx])
                }
            }
            fnum -= 1
        }
        
        // 사람 이동 처리
        var jnum = jQueue.count
        var success = false
        while jnum > 0 {
            let node = jQueue.removeFirst()
            for i in 0..<4 {
                let ny = node[0] + dy[i]
                let nx = node[1] + dx[i]
                if (0..<x) ~= nx, (0..<y) ~= ny, arr[ny][nx] == ".", !visitedJ[ny][nx], !visitedF[ny][nx] {
                    if ny == 0 || ny == y - 1 || nx == 0 || nx == x - 1 {
                        print(cnt + 1)
                        return
                    }
                    visitedJ[ny][nx] = true
                    jQueue.append([ny, nx])
                    success = true
                }
            }
            jnum -= 1
        }
        
        if jQueue.isEmpty && !success {
            print("IMPOSSIBLE")
            return
        }
    }
}

fire()