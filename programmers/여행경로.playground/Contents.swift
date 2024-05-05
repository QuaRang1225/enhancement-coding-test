import UIKit

//func solution(_ tickets:[[String]]) -> [String] {
//    
//    var route = [String]()
//    
//    func dfs(_ index:Int,_ tickets:[[String]],_ place : String){
//        
//        route.append(place)
////        guard !tickets.isEmpty else {return}
//        var tickets = tickets
//        let needs = tickets.filter({$0[0] == place})
//        print(needs)
//        for need in needs{
//            
//            let first = tickets.remove(at: Int(tickets.firstIndex(where: {$0 == need})!))
//            dfs(index + 1, tickets ,first[1])
//        }
//            
//        
//    }
//    dfs(0, tickets,"ICN")
//    return route
//}
func solution(_ tickets:[[String]]) -> [String] {
    var tickets = tickets.sorted {$0[1] < $1[1]}
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
print(solution(    [["ICN", "A"], ["A", "B"], ["A", "C"], ["C", "A"], ["B", "D"]]    ))
//            print("\(index + 1)       \(tickets)       \(first[1])")
