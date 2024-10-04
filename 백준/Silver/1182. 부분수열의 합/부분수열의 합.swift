let input = readLine()!.split(separator: " ").compactMap{Int($0)}
let (n,s) = (input[0],input[1])
let arr = readLine()!.split(separator: " ").compactMap{Int($0)}
var cnt = 0
func dfs(_ depth:Int,_ total:Int){
    if depth == n {
        if total == s{ cnt += 1 }
        return
    }
    dfs(depth+1, total)
    dfs(depth+1, total + arr[depth])
}

dfs(0,0)
print(s == 0 ? cnt - 1 : cnt)