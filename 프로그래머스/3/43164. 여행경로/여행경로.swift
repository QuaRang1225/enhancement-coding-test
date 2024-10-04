import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var tickets = tickets.sorted{ $0[1] < $1[1] }
    var visited = [Bool](repeating: false, count: tickets.count)

    var route = [String]()
    
    func dfs(_ start:String){
        guard route.count != tickets.count else{
            route.append(start)
            return
        }
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