let n = Int(readLine()!)!
    var k = readLine()!.split(separator: " ").map { Int($0)! }
    let m = Int(readLine()!)!
    let l = readLine()!.split(separator: " ").map { Int($0)! }

    var dp = [[Bool]](repeating: [Bool](repeating: false, count: (n + 1) * 500 + 1), count: n + 1)
    var result = [String]()

    func cal(_ num: Int, _ weight: Int) {
        if num > n || dp[num][weight]{ return }
        dp[num][weight] = true
        
        if num < n {
            cal(num + 1, weight)
            cal(num + 1, weight + k[num])
            cal(num + 1, abs(weight - k[num]))
        }
    }
    cal(0, 0)
    for i in l {
        if i > 15000 {
            result.append("N")
            continue
        }
        result.append(dp[n][i] ? "Y" : "N")
    }
    print(result.joined(separator: " "))