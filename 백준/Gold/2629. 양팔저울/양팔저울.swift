let n = Int(readLine()!)!
let weights = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = Int(readLine()!)!
let marble = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Set<Int>()

for weight in weights {
    var tmp:Set<Int> = [weight]
    for d in dp {
        tmp.insert(abs(weight-d))
        tmp.insert(weight+d)
    }
    dp.formUnion(tmp)
}
print(marble.map{dp.contains($0) ? "Y" : "N"}.joined(separator: " "))