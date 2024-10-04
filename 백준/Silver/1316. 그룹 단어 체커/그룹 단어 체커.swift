let n = Int(readLine()!)!
var arr = [[String]]()
var cnt = 0

for _ in 0..<n{ arr.append(readLine()!.map{String($0)}.reversed()) }
for i in 0..<n{
    var words = [String]()
    let arrs = arr
    while !arr[i].isEmpty{
        let last = arr[i].removeLast()
        if !words.contains(last) || words.last == last{
            words.append(last)
        }
    }
    if words == arrs[i].reversed(){cnt += 1}
}
print(cnt)