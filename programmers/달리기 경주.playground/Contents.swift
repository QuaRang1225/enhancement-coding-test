import UIKit

func solution(_ players:[String], _ callings:[String]) -> [String] {
    
    var rank = Dictionary(uniqueKeysWithValues: players.enumerated().map{($1,$0)})
    var players = players
    
    callings.forEach{
        let index = rank[$0]!
        
        rank[players[index]]! -= 1
        rank[players[index-1]]! += 1
        
        players.swapAt(index, index-1)
        
    }
    return players
}

print(solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"]))
