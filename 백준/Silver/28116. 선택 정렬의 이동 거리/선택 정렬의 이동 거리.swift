let count = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }
var moves = [Int](repeating: 0, count: count)
var dict = [Int: Int]()

array.enumerated().forEach{dict[$1] = $0}
var num = 1

for i in 0..<count {
    if array[i] != num {
        if let location = dict[num] {
            array.swapAt(i, location)
            let move = location - i
            moves[i] += move
            moves[array[location]-1] += move
            dict[num] = i
            dict[array[location]] = location
        }
    }
    num += 1
}
print(moves.map { String($0) }.joined(separator: " "))