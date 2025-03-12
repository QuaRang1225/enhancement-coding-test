import Foundation

//백트래킹 문제
func solution(_ tickets:[[String]]) -> [String] {
    //모든 루트를 순회할 경우에 알파벳순으로 정렬하기 위해 사전에 준비
    //미리 정렬을 할경우 검색 순서가 알파벳이 작은 순부터 탐색하기 때문
    var tickets = tickets.sorted{ $0[1] < $1[1] }
    var visited = [Bool](repeating: false, count: tickets.count)

    var route = [String]()
    
    func dfs(_ start:String){
        //모든 경로 탐색이 안료됐을 때 도착지를 루트에 추가하고 리턴
        guard route.count != tickets.count else{
            route.append(start)
            return
        }
        //티켓을 하나씩 사용하며 루트에 추가
        //만약 경로를 탐색하던 중 티켓사용을 할 수 없는 단계가 나오면 뒤로 되돌아가야함
        //만약 티켓 사용을 완료했을 경우, tickets의 개수와 결과의 개수는 언제나 1개씩 차이가 남으로 조건을 걸고 재귀를 탈출함
        //여기서 조건을 걸지 않을 경우, 다시 탐색에 들어가기 때문(탈출조건)
        for i in 0..<tickets.count{
            if tickets[i][0] == start,!visited[i]{
                visited[i] = true
                route.append(start)
                dfs(tickets[i][1])
                if route.count == tickets.count + 1{ return }
                route.removeLast()
                visited[i] = false
            }
        }
    }
    dfs("ICN")
    return route
}