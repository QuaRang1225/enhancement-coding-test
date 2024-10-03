let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let (n,m) = (input[0],input[1])

func dfs(_ num:Int,_ arr:[Int]){
    if arr.count == m{
        arr.forEach{ print($0, terminator: " ") }
        print()
        return
    }
    for i in num...n{
        dfs(i,arr + [i])
    }
}
dfs(1,[])