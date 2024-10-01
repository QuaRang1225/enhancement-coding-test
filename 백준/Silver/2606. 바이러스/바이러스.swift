let n = Int(readLine()!)!
let m = Int(readLine()!)!
var arr = [Int:[Int]]()
var visited = [Bool](repeating: false, count: n+1)
var cnt = 0
(0..<m).forEach { _ in
                 let n = readLine()!.split(separator: " ").compactMap{Int($0)}
                 arr[n[0],default: []].append(n[1])
                 arr[n[1],default: []].append(n[0])
                }
func dfs(_ s:Int){
    visited[s] = true
    guard let a = arr[s] else {return}
    for i in a{
        if !visited[i]{
            cnt += 1
            dfs(i)
        }
    }
}
dfs(1)
print(cnt)