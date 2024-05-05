import Foundation


func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    var result = 25000
    var visited = Array(repeating: false, count: words.count)
    guard (words.firstIndex(where: {$0 == target}) != nil) else{ return 0 }
    
    func dfs(_ begin: String, _ cnt: Int) {
        guard begin != target else{
            result = min(result,cnt)
            return
        }
        
        for i in 0..<words.count {
            guard !visited[i] else{ continue }
            
            let begins = begin.map{String($0)}
            let wordArr = words[i].map{String($0)}
            var compare = 0
            
            for j in 0..<begins.count {
                if begins[j] != wordArr[j] {
                    compare += 1
                }
            }
            
            if compare == 1{
                visited[i] = words[i] == target ? false : true
                dfs(words[i], cnt + 1)
            }
            
        }
        
    }
    dfs(begin, 0)
    
    return result
}


print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]  ))
