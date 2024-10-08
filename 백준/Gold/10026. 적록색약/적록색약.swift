let n = Int(readLine()!)!
var arr = [[String]]()
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var blinder = false
var cnt = (a:0,b:0)
for _ in 0..<n{
    arr.append(readLine()!.map{String($0)})
}

func dfs(_ y:Int,_ x:Int,_ search:String){
    guard (0..<n)~=y,(0..<n)~=x,!visited[y][x],arr[y][x] == search else { return }
    visited[y][x] = true
    if search == "R"{arr[y][x] = "G" }
    dfs(y+1, x,search)
    dfs(y-1, x,search)
    dfs(y, x+1,search)
    dfs(y, x-1,search)
}
for _ in 0..<2{
    for i in 0..<n{
        for j in 0..<n{
            if !visited[i][j]{
                if !blinder{
                    if arr[i][j] == "R"{
                        dfs(i, j, "R")
                    }else if arr[i][j] == "G"{
                        dfs(i, j, "G")
                    }else if arr[i][j] == "B"{
                        dfs(i, j, "B")
                    }
                    cnt.a += 1
                }else{
                    if arr[i][j] == "G"{
                        dfs(i, j, "G")
                    }
                    else if arr[i][j] == "B"{
                        dfs(i, j, "B")
                    }
                    cnt.b += 1
                }
            }
        }
    }
    blinder = true
    visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
}
print(cnt.a,cnt.b)