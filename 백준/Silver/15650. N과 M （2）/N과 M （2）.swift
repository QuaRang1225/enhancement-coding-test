let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let (n,m) = (input[0],input[1])
var visited = [Bool](repeating: false, count: n+1)

func dfs(_ depth:Int,_ arr:[Int]){
    if depth == m{
        if arr.sorted() == arr{ print(arr.map{String($0)}.joined(separator: " ")) }
        return
    }
    for i in 1...n{
        if !visited[i]{
            visited[i] = true
            dfs(depth+1,arr + [i])
            visited[i] = false
        }
    }
}
dfs(0,[])