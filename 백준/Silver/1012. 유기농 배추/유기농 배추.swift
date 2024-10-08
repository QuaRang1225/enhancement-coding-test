let num = Int(readLine()!)!
var cnt = 0
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var result = [Int]()

for _ in 0..<num{
    var start = [[Int]]()
    let input = readLine()!.split(separator: " ").compactMap{Int($0)}
    let (m,n,k) = (input[0],input[1],input[2])
    var visitied = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    for _ in 0..<k{
        start.append(readLine()!.split(separator: " ").compactMap{ Int($0) })
    }
    while !start.isEmpty{
        var queue = [start.removeFirst()]
        while !queue.isEmpty{
            let node = queue.removeFirst()
            visitied[node[1]][node[0]] = true
            for i in 0..<4{
                let nx = node[0] + dx[i]
                let ny = node[1] + dy[i]
                if (0..<n)~=ny,(0..<m)~=nx,!visitied[ny][nx],let index = start.firstIndex(where: {$0 == [nx,ny]}){
                    start.remove(at: index)
                    queue.append([nx,ny])
                }
            }
        }
        cnt += 1
    }
    result.append(cnt)
    cnt = 0
    start.removeAll()
}
result.forEach{print($0)}