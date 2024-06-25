import Foundation

func solution(_ word:String) -> Int {
        var words = ["A","E","I","O","U"]
        var combine = [String]()
        
        func dfs(strings:String){
            combine.append(strings)
            if let last = combine.last,last == word{return}
            guard strings.count < words.count else { return }
            for i in 0..<5{
                dfs(strings: strings + words[i])
                if let last = combine.last,last == word{return}
            }
        }
        dfs(strings: "")
        return combine.firstIndex(where: {$0 == word})!
    }