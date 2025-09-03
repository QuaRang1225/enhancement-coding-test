import Foundation

func solution(_ info:[[Int]], _ n:Int, _ m:Int) -> Int {
    let size = info.count
    let INF = n  // n 자체가 잡히는 기준이기 때문에 충분히 큰 값
    // dp[i][a][b] = Bool: i까지 진행했을 때 (A 흔적 = a, B 흔적 = b)가 가능한가
    var dp = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: size + 1)
    dp[0][0][0] = true

    for i in 0..<size {
        let aCost = info[i][0]
        let bCost = info[i][1]
        for a in 0..<n {
            for b in 0..<m {
                if !dp[i][a][b] { continue }
                // A가 훔친 경우
                if a + aCost < n {
                    dp[i + 1][a + aCost][b] = true
                }
                // B가 훔친 경우
                if b + bCost < m {
                    dp[i + 1][a][b + bCost] = true
                }
            }
        }
    }
    
    // 마지막 단계에서 가능한 케이스 중, A 흔적의 최솟값을 찾기
    for a in 0..<n {
        for b in 0..<m {
            if dp[size][a][b] {
                return a
            }
        }
    }
    return -1
}

// 2차원 배열로 반복문을 돌림
// 첫번 쨰 절도 시 A와 B가 각각 물건을 훔쳐보고 