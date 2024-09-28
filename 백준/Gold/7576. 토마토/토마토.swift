let input = readLine()!.split(separator: " ").compactMap{Int($0)}
    let (y,x) = (input[1],input[0])
    
    var arr = [[Int]]()
    var queueA = [[Int]]()
    var queueB = [[Int]]()
    var cnt = 0
    
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    (0..<y).forEach{ i in
        let line = readLine()!.split(separator: " ").compactMap{Int($0)}
        arr.append(line)
        queueA.append(contentsOf: line.enumerated().filter{$0.element == 1}.map{[i,$0.offset]})
    }
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: x), count: y)
    queueA.forEach{ visited[$0[0]][$0[1]] = true }
    
    while !queueA.isEmpty{
        let node = queueA.removeLast()
        for i in 0..<4{
            let dy = dy[i] + node[0]
            let dx = dx[i] + node[1]
            if (0..<y)~=dy,(0..<x)~=dx,!visited[dy][dx],arr[dy][dx] == 0{
                visited[dy][dx] = true
                queueB.append([dy,dx])
                arr[dy][dx] = 1
            }
        }
        if queueA.isEmpty{
            queueA = queueB
            queueB = []
            cnt += 1
        }
    }
    cnt -= 1
    if arr.flatMap({$0}).contains(0){print(-1)}
    else{print(cnt)}