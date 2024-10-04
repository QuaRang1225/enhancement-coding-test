var inputs = [[Int]]()
while true{
    let input = readLine()!.split(separator: " ").compactMap{Int($0)}
    guard input[0] != 0 else{break}
    inputs.append(input)
}
for inp in inputs{
    var inp = inp
    let n = inp.removeFirst()
    var visited = [Bool](repeating: false, count: n)

    dfs(0, 0,[])
    print()
    func dfs(_ n:Int,_ start:Int,_ arr:[Int]){
        if n == 6{
            print(arr.map{String($0)}.joined(separator: " "))
            return
        }
        for i in start..<inp.count{
            if !visited[i]{
                visited[i] = true
                dfs(n+1, i,arr+[inp[i]])
                visited[i] = false
            }
        }
    }
}