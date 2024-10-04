let n = Int(readLine()!)!
var a = [String]()
var b = [String]()
for _ in 0..<n{a.append(readLine()!)}
for _ in 0..<n{b.append(readLine()!)}
var cnt = 0
while !a.isEmpty{
    let n = b.removeFirst()
    if a[0] != n{ cnt += 1 }
    a = a.filter{ $0 != n }
}
print(cnt)