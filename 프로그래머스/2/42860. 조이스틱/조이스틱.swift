import Foundation

func solution(_ name:String) -> Int {
    var count = 0
    let chars = Array(name)
    let n = chars.count
    var move = n - 1
    
    for i in chars.indices{
        let asciiValue = chars[i].asciiValue!
        let index = Int(asciiValue - Character("A").asciiValue!)
        
        var next = i + 1
        while next < n && chars[next] == "A"{
            next += 1
        }
        let rightThenLeft = i * 2 + (n - next)           // 오른쪽 -> 왼쪽
        let leftThenRight = (n - next) * 2 + i           // 왼쪽 -> 오른쪽
        move = min(move, rightThenLeft, leftThenRight)
        count += min(index, 26 - index)

        
    }
    count += move
    return count
}