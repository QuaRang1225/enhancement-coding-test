let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let (n,m) = (input[0],input[1])
var visited = [Bool](repeating: false, count: n)

func dfs(_ depth:Int,_ arr:String){
    if depth == m{
        print(arr)
        return
    }
    for i in 0..<n{
        visited[i] = true
        dfs(depth+1,"\(arr)\(i+1) ")
        visited[i] = false
    }
}
dfs(0,"")