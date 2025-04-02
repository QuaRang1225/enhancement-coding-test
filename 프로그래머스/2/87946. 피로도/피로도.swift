import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    var result = 0
    var visited = [Bool](repeating: false, count: dungeons.count)
    func dfs(fatigue:Int,cnt:Int){
        result = max(result,cnt)
        for i in dungeons.indices{
            if !visited[i],dungeons[i][0] <= fatigue{
                visited[i] = true
                dfs(fatigue: fatigue - dungeons[i][1], cnt: cnt + 1)
                visited[i] = false
            }
        }
    }
    dfs(fatigue: k, cnt: 0)
    return result
}