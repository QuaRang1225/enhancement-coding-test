let n = Int(readLine()!)!
var hVisited = [Bool](repeating:false, count: n)
var aVisited = [Bool](repeating:false, count: n*2)
var dVisited = [Bool](repeating:false, count: n*2)
var cnt = 0
dfs(0)

func dfs(_ y:Int){
    if y == n{
        cnt += 1
        return
    }
    for x in 0..<n{
        if hVisited[x] || aVisited[x+y] || dVisited[y-x+n-1]{ continue }
        set(x,y, true)
        dfs(y+1)
        set(x,y, false)

    }
}
func set(_ x:Int,_ y:Int,_ state:Bool){
    hVisited[x] = state
    aVisited[x+y] = state
    dVisited[y-x+n-1] = state
}
print(cnt)