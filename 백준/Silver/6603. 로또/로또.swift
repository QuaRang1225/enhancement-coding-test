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

    dfs(0,[])
    print()
    func dfs(_ start:Int,_ arr:[Int]){
        if arr.count == 6{
            print(arr.map{String($0)}.joined(separator: " "))
            return
        }
        for i in start..<inp.count{
            if !visited[i]{
                visited[i] = true
                dfs(i,arr+[inp[i]])
                visited[i] = false
            }
        }
    }
}