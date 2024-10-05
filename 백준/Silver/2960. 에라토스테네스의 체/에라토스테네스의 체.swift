let input = readLine()!.split(separator: " ").compactMap{Int($0)}
let (n,k) = (input[0],input[1])
var visited = [Bool](repeating: false, count: n+1)
var cnt = 0

dfs(2)
func dfs(_ start:Int){
    for i in start...n{
        if !visited[i],i % start == 0{
            visited[i] = true
            cnt += 1
            if cnt == k{
                print(i)
                return
            }
        }
    }
    dfs(start+1)
}