let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let input1 = readLine()!.split(separator: " ").compactMap{ Int($0) }.sorted()
let (n,m) = (input[0],input[1])
var visited = [Bool](repeating: false, count: input1.last!+1)

func dfs(_ depth:Int,_ arr:String){
    if depth == m{
        print(arr)
        return
    }
    for i in input1.indices{
        if !visited[input1[i]]{
            visited[input1[i]] = true
            dfs(depth+1,"\(arr)\(input1[i]) ")
            visited[input1[i]] = false
        }
    }
}
dfs(0, "")