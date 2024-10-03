let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let (n,m) = (input[0],input[1])
var arr = [Int]()
var visited = [Bool](repeating: false, count: n)

func dfs(_ depth:Int){
    if depth == m{
        print(arr.map{String($0)}.joined(separator: " "))
        return
    }
    for i in 0..<n{
        if !visited[i]{
            visited[i] = true
            arr.append(i+1)
            dfs(depth+1)
            arr.removeLast()
            visited[i] = false
        }
    }
}
dfs(0)