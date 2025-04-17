import Foundation

func solution(_ name:String) -> Int {
    var count = 0
    let chars = Array(name)
    let n = chars.count
    var move = n - 1
    
    for i in chars.indices{
        let index = Int(chars[i].asciiValue!) - 65
        count += min(index, 26 - index)
        
        var next = i + 1
        while next < n && chars[next] == "A"{
            next += 1
        }
        let rl = i * 2 + (n - next)      //4 + (11 - 3) = 12         
        let lr = (n - next) * 2 + i       //2(11-3) + 2 = 18   
        move = min(move, rl, lr)
        //ZZZAAABBAAT
        //ZZZ"AAAAAAAA"
    }
    return count + move
}