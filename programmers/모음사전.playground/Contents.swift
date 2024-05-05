import UIKit



func solution(_ word:String) -> Int {
    var words = ["A","E","I","O","U"]
    var combine = [String]()
    
    func dfs(strings:String){
        combine.append(strings)
        guard strings.count < words.count else { return }
        for i in 0..<5{
            dfs(strings: strings + words[i])
        }
    }
    dfs(strings: "")
    return combine.firstIndex(where: {$0 == word})!
}

print(solution(    "AAAAE"  ))
