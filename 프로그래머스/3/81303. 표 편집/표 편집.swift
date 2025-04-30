import Foundation

class Node {
    var up: Node?
    var down: Node?
    var index: Int = 0
    
    init(up: Node? = nil, down: Node? = nil, index: Int) {
        self.up = up
        self.down = down
        self.index = index
    }
}
func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var result: [String] = Array(repeating: "O", count: n)
    
    var linkedList: [Node] = []
    for i in 0..<n {
        linkedList.append(Node(index: i))
    }
    
    linkedList[0].down = linkedList[1]
    for i in 1...n-2 {
        linkedList[i].up = linkedList[i-1]
        linkedList[i].down = linkedList[i+1]
    }
    linkedList[n-1].up = linkedList[n-2]
    
    var cursor: Node = linkedList[k]
    
    var cancels: [Node] = []
    for command in cmd {
        let cmdArray = command.components(separatedBy: " ")
        
        switch cmdArray.first {
            case "U":
                let times = Int(cmdArray[1])!    
                for _ in 0..<times {
                    cursor = cursor.up! 
                }
            case "D":
                let times = Int(cmdArray[1])!    
                for _ in 0..<times {
                    cursor = cursor.down! 
                }
            case "C":
                result[cursor.index] = "X"
                cancels.append(cursor)
                cursor.up?.down = cursor.down
                cursor.down?.up = cursor.up
                if cursor.down == nil { 
                    cursor = cursor.up!
                } else {
                    cursor = cursor.down!
                }
            case "Z":
                let top = cancels.popLast()!
                result[top.index] = "O"    
                
                top.up?.down = top
                top.down?.up = top
            default: break
        }
    }
    
    return result.joined()
}