let input = readLine()!.split(separator: " ").compactMap{Int($0)}
    let (n,m,v) = (input[0],input[1],input[2])
    var arr = [Int:[Int]]()
    
    (0..<m).forEach{ _ in
        let input = readLine()!.split(separator: " ").compactMap{Int($0)}
        arr[input[0],default: []].append(input[1])
        arr[input[1],default: []].append(input[0])
    }
    var visited = [Bool](repeating: false, count: n+1)
    var resultArr = "\(v) "
    
    func dfs(_ start:Int){
        visited[start] = true
        guard let a = arr[start]?.sorted() else {return}
        for i in a{
            if !visited[i]{
                resultArr += "\(i) "
                dfs(i)
            }
        }
    }
    func bfs(){
        var queue = [v]
        visited[v] = true
        while !queue.isEmpty{
            let node = queue.removeFirst()
            guard let a = arr[node]?.sorted() else {return}
            for i in a{
                if !visited[i]{
                    resultArr += "\(i) "
                    visited[i] = true
                    queue.append(i)
                }
            }
        }
    }
    dfs(v)
    print(resultArr)
    
    visited = [Bool](repeating: false, count: n+1)
    resultArr = "\(v) "
    
    bfs()
    print(resultArr)