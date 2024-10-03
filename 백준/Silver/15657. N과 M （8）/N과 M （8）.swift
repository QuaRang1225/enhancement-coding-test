let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let input1 = readLine()!.split(separator: " ").compactMap{ Int($0) }.sorted()
let m = input[1]
var result = ""

func dfs(_ depth:Int,_ arr:String,_ num:Int){
    if depth == m{
        result += arr + "\n"
        return
    }
    for i in num..<input1.count{
        dfs(depth+1,"\(arr)\(input1[i]) ",i)
    }
}
dfs(0,result,0)
print(result)