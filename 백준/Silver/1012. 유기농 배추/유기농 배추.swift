for _ in 0..<Int(readLine()!)!{
    var cnt = 0
    let input = readLine()!.split(separator: " ").compactMap{Int($0)}
    let (m,n,k) = (input[0],input[1],input[2])
    var visitied = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    
    for _ in 0..<k{
        let c = readLine()!.split(separator: " ").compactMap{ Int($0) }
        visitied[c[1]][c[0]] = 1
    }
    func dfs(_ x:Int,_ y:Int){
        guard (0..<m)~=x,(0..<n)~=y,visitied[y][x] == 1 else {return}
        visitied[y][x] = 0
        dfs(x,y+1)
        dfs(x,y-1)
        dfs(x+1,y)
        dfs(x-1,y)
    }
    for i in 0..<n{
        for j in 0..<m{
            if visitied[i][j] == 1{
                dfs(j, i)
                cnt += 1
            }
        }
    }
    print(cnt)
}