import UIKit

//func solution(_ n:Int, _ computers:[[Int]]) -> Int {
//    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
//    var cnt = 0
//
//    func bfs(x:Int,y:Int){
//        var queue = [(y,x)]
//        let dx = [1,-1,0,0]
//        let dy = [0,0,1,-1]
//
//        while !queue.isEmpty{
//            var (ex,ey) = queue.removeFirst()
//            for i in 0..<4{
//                let ny = ey + dy[i]
//                let nx = ex + dx[i]
//                if 0 <= ny,ny < n,0 <= nx,nx < n{
//                    if computers[ny][nx] == 1,!visited[ny][nx]{
//                        visited[ny][nx] = true
//                        queue.append((ny,nx))
//                    }
//                }
//            }
//        }
//
//    }
//    (0..<n).forEach{ i in
//        (0..<n).forEach{ j in
//            if computers[i][j] == 1,!visited[i][j]{
//                cnt += 1
//                bfs(x: j, y: i)
//            }
//        }
//    }
//
//    return cnt
//}
func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var visited = [Bool](repeating: false, count: n)
    var answer = 0
    
    func dfs(_ y:Int){
        visited[y] = true
        (0..<n).forEach{
            if !visited[$0],computers[y][$0] == 1{  dfs($0) }
        }
    }
    (0..<n).forEach {
        if !visited[$0]{
            answer += 1
            dfs($0)
        }
    }
    
    return answer
}
print(solution(  3  ,     [[1, 1, 0], [1, 1, 0], [0, 0, 1]]    ))
