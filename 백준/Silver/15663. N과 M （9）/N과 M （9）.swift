let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let input1 = readLine()!.split(separator: " ").compactMap{ Int($0) }.sorted()
let (n,m) = (input[0],input[1])
var visited = [Bool](repeating: false, count: n)

func dfs(_ depth:Int,_ arr:String){
    var last = 0
    if depth == m{
        print(arr)
        return
    }
    for i in 0..<n{
        if !visited[i],last != input1[i]{
            visited[i] = true
            dfs(depth+1,"\(arr)\(input1[i]) ")
            last = input1[i]
            visited[i] = false
        }
    }
}
dfs(0,"")