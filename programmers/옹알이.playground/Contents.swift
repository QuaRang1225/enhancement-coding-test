import Foundation


//func solution(_ babbling:[String]) -> Int {
//    return babbling.filter{ word in
//        var word = word
//        ["aya", "ye", "woo", "ma"].forEach{word = word.replacingOccurrences(of: $0, with: "")}
//        return word.isEmpty
//    }.count
//}
//print(solution(["aya", "yee", "u", "maa", "wyeoo"]))


func solution(_ babbling:[String]) -> Int {
    var babbling = babbling
    let basick = ["aya", "ye", "woo", "ma"]
    var count = 0
    basick.forEach{ word in
        babbling = babbling.map{$0.replacingOccurrences(of: word, with: "0")}
        count = babbling.compactMap{Int($0)}.count
    }

    return count
}
