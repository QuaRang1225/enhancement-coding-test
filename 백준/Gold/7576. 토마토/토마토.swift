let input = readLine()!.split(separator: " ").compactMap{Int($0)}
let (y, x) = (input[1], input[0])

var arr = [[Int]]()
var queue = [[Int]]()
var front = 0
var cnt = 0

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

// 입력 받기
(0..<y).forEach { i in
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    arr.append(line)
    queue.append(contentsOf: line.enumerated().filter { $0.element == 1 }.map { [i, $0.offset] })
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: x), count: y)
queue.forEach { visited[$0[0]][$0[1]] = true }

// BFS 탐색
while front < queue.count {
    let size = queue.count
    for _ in 0..<size - front {
        let node = queue[front]
        front += 1

        for i in 0..<4 {
            let ny = dy[i] + node[0]
            let nx = dx[i] + node[1]

            if (0..<y) ~= ny, (0..<x) ~= nx, !visited[ny][nx], arr[ny][nx] == 0 {
                visited[ny][nx] = true
                queue.append([ny, nx])
                arr[ny][nx] = 1
            }
        }
    }
    cnt += 1
}

cnt -= 1
if arr.flatMap({ $0 }).contains(0) {
    print(-1)
} else {
    print(cnt)
}
