import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
        
        var visited = [Bool](repeating: false, count: n)
        var answer = 0
        
        func dfs(_ y:Int){
            visited[y] = true
            for i in (0..<n) where !visited[i] && computers[y][i] == 1{
                dfs(i)
            }
        }
        for i in (0..<n) where !visited[i]{
            dfs(i)
            answer += 1
        }
        
        return answer
}