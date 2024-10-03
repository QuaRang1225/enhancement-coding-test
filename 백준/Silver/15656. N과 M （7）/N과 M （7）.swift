let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let input1 = readLine()!.split(separator: " ").compactMap{ Int($0) }.sorted()
let m = input[1]
var visited = [Bool](repeating: false, count: input1.last! + 1)
var result = ""
func dfs(_ depth:Int,_ arr:String){
    if depth == m{
        result += arr + "\n"
        return
    }
    for i in 0..<input1.count{
        dfs(depth+1,"\(arr)\(input1[i]) ")
    }
}
dfs(0,result)
print(result)