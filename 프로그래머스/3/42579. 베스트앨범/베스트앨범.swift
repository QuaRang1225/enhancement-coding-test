import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var genreDict = [String:[(index:Int,play:Int)]]()
    
    genres.enumerated().forEach{ (index,genre) in
        genreDict[genre , default : []].append((index,plays[index]))
    }
    
    var sortedTupleArr = [(index:[Int],sum:Int)]()
    genreDict.forEach { (_,item) in
        let sorted = item.sorted{ $1.play < $0.play }
        let sum = sorted.map{$0.play}.reduce(0, +)
        sortedTupleArr.append((sorted.prefix(2).map{$0.index},sum))
    }
    return sortedTupleArr.sorted{ $0.sum > $1.sum}.flatMap{$0.index}
}