import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var dp = Array(repeating: [Int](), count: 9)
    for i in 1..<9 {
        dp[i].append(Int(String(repeating: String(N), count: i))!)
        for j in 1..<i {
            for x1 in dp[j] {
                for x2 in dp[i-j] {
                    dp[i].append(x1*x2)
                    dp[i].append(x1+x2)
                    dp[i].append(x1-x2)
                    if x2 != 0 { dp[i].append(x1/x2) }
                }

            }
        }
        if dp[i].contains(number){ return i }
    }
    return -1
}