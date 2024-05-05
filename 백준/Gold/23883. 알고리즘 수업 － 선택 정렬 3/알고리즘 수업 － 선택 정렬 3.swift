let input = readLine()!.split(separator: " ").map { Int($0)! }

var A = readLine()!.split(separator: " ").map { Int($0)! }
let B = A.sorted()

var dic = [Int: Int]()

for (idx, val) in A.enumerated() {
    dic[val] = idx
}

var cnt = 0
for i in stride(from: input[0]-1, through: 0, by: -1) {
    if A[i] != B[i] {
        let temp = [A[i], B[i]]
        A.swapAt(i, dic[B[i]]!)
        let tmp = dic[temp[0]]
        dic[temp[0]] = dic[temp[1]]
        dic[temp[1]] = tmp
        cnt += 1
        if input[1] == cnt {
            print("\(temp[0]) \(temp[1])")
            break
        }
    }
    
}
if cnt < input[1]{
    print(-1)
}