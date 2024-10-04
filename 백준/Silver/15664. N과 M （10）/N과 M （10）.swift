let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let input1 = readLine()!.split(separator: " ").compactMap{ Int($0) }.sorted()
let (n,m) = (input[0],input[1])
var visited = [Bool](repeating: false, count: n)
var last = 0

func dfs(_ depth:Int,_ start:Int,_ arr:String){
    if depth == m{
        print(arr)
        return
    }
    for i in start..<n{
        if !visited[i],last != input1[i]{
            visited[i] = true
            dfs(depth+1,i,"\(arr)\(input1[i]) ")
            last = input1[i]
            visited[i] = false
        }
    }
}
dfs(0,0,"")