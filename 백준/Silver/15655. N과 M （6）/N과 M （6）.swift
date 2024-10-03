let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let input1 = readLine()!.split(separator: " ").compactMap{ Int($0) }.sorted()
let (n,m) = (input[0],input[1])
var visited = [Bool](repeating: false, count: input1.last! + 1)

func dfs(_ num:Int,_ arr:[Int]){
    if arr.count == m{
        arr.forEach{ print($0,terminator: " ")}
        print()
        return
    }
    for i in num..<input1.count{
        if !visited[input1[i]]{
            visited[input1[i]] = true
            dfs(i, arr + [input1[i]])
            visited[input1[i]] = false
        }
    }
}
dfs(0, [])