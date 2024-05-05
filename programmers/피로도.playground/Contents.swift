import UIKit


func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    var result = 0
    var visited = [Bool](repeating: false, count: dungeons.count)
    func dfs(pirodo:Int,cnt:Int){
        result = max(result,cnt)
        for i in (0..<dungeons.count){
            if !visited[i],dungeons[i][0] <= pirodo{
                visited[i] = true   //특정 인덱스 검사
                dfs(pirodo: pirodo - dungeons[i][1], cnt: cnt + 1)
                visited[i] = false  //검사 완료되고 다른 케이스를 검사하기 위함
            }
        }
    }
    dfs(pirodo: k, cnt: 0)
    return result
}

print(solution(80, [[80,20],[50,40],[30,10]]    ))



