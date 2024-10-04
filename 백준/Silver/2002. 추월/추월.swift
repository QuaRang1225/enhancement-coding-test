let n = Int(readLine()!)!
var stack1 = [String]()
var stack2 = [String]()
for _ in 0..<n{stack1.append(readLine()!)}
for _ in 0..<n{stack2.append(readLine()!)}
var cnt = 0
while !stack1.isEmpty{
    let n = stack2.removeFirst()
    if stack1[0] != n{
        cnt += 1
    }
    stack1 = stack1.filter{ $0 != n}
}
print(cnt)