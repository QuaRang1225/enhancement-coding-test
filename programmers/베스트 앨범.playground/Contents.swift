import UIKit

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var genreDict = [String:[(index:Int,play:Int)]]()
    
    genres.enumerated().forEach{ (index,genre) in
        genreDict[genre , default : []].append((index,plays[index]))
    }
    
    var sortedDict = [(index:[Int],sum:Int)]()
    genreDict.forEach { (_,index) in
        let sorted = index.sorted{ $1.play < $0.play}
        let sum = sorted.map{$0.play}.reduce(0, +)
        sortedDict.append((sorted.prefix(2).map{$0.index},sum))
    }
    return sortedDict.sorted{ $0.sum > $1.sum}.flatMap{$0.index}
}


print(solution(  ["classic", "pop", "classic", "classic", "pop"]  , [500, 600, 150, 800, 2500]    ))

