func fire(){
    let input = readLine()!.split(separator: " ").compactMap{Int($0)}
    let (y,x) = (input[0],input[1])
    
    var j = [Int]()
    var f = [[Int]]()
    
    var arr = [[String]]()
    
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    (0..<y).forEach{ i in
        let line = readLine()!.compactMap{ String($0)}
        arr.append(line)
        if let index = line.firstIndex(of: "J"){ j = [i,index] }
        f.append(contentsOf: line.enumerated().filter{$0.element == "F"}.map{[i,$0.offset]})
    }
    if j[0] == 0 || j[0] == y || j[1] == 0 || j[1] == x {
        print(1)
        return
    }
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: x), count: y)
    
    var jQueue = [j]
    var fQueue = f
    
    var cnt = 0
    
    var fnum = 0
    var jnum = 0
 
    while true{
        cnt += 1
        
        fnum = fQueue.count
        while 0 < fnum{
            let node = fQueue.removeFirst()
            for i in 0..<4{
                let ny = node[0] + dy[i]
                let nx = node[1] + dx[i]
                if (0..<x)~=nx,(0..<y)~=ny,arr[ny][nx]==".",!visited[ny][nx]{
                    visited[ny][nx] = true
                    fQueue.append([ny,nx])
                }
            }
            fnum -= 1
        }
        
        jnum = jQueue.count
        var success = false
        while 0 < jnum{
            let node = jQueue.removeFirst()
            for i in 0..<4{
                let ny = node[0] + dy[i]
                let nx = node[1] + dx[i]
                if (0..<x)~=nx,(0..<y)~=ny,arr[ny][nx]==".",!visited[ny][nx]{
                    if ny == 0 || ny == y-1 || nx == 0 || nx == x-1{
                        print(cnt + 1)
                        return
                    }
                    visited[ny][nx] = true
                    jQueue.append([ny,nx])
                    success = true
                }
            }
           
            jnum -= 1
        }
        if !success,jQueue.isEmpty{
            print("IMPOSSIBLE")
            return
        }
    }
}
fire()