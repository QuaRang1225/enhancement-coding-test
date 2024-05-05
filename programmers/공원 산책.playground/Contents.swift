import Foundation


func solution(_ park:[String], _ routes:[String]) -> [Int] {
    
    var parkMap = park.map{Array($0)}
    var routes = routes.map{Array($0).filter{$0 != " "}.map{String($0)}}
    
    var coordinate :[Int] = []
    Loop : for (indexY, parkY) in parkMap.enumerated() {
        for (indexX, parkX) in parkY.enumerated() {
            if parkX == "S" {
                coordinate = [indexY, indexX]
                break Loop
            }
        }
    }
    
    let (countX,countY) = (parkMap[0].count,park.count)
    
    func move(_ direction: String, _ distance: Int) -> [Int] {

            var current = coordinate
            let dx = [1, -1, 0, 0]
            let dy = [0, 0, 1, -1]

            let directions = ["E", "W", "S", "N"]
            let i = directions.firstIndex(of: direction)!

            for _ in 1...distance {
                let next = (x : current[1] + dx[i], y : current[0] + dy[i])
                guard (0..<countX).contains(next.x) && (0..<countY).contains(next.y) && parkMap[next.y][next.x] != "X" else{ return coordinate }
                    current[1] = next.x
                    current[0] = next.y
            }
            return current
        }
    
    routes.forEach { coordinate = move($0[0], Int($0[1])!) }
    return coordinate
}
print(solution(       ["SOOO","XOOO","OOOO","OOOO"]     ,  ["E 40","S 3","W 1","N 2"]      ))
