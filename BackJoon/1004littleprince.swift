//
//  1004littleprince.swift
//  BackJoon
//
//  Created by 유영웅 on 2023/07/12.
//

import Foundation


func littleprince(){
    let T = Int(readLine()!)!
    for _ in 0..<T{
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let x1 = input[0],y1 = input[1],x2 = input[2],y2 = input[3]
        let num = Int(readLine()!)!
        var count = 0
        for _ in 0..<num{
            let starinput = readLine()!.split(separator: " ").map { Int($0)! }
            let x = starinput[0],y = starinput[1], r = Double(starinput[2])

            let distance1 = sqrt(Double(pow(Double(x1 - x), 2) + pow(Double(y1 - y), 2)))
            let distance2 = sqrt(Double(pow(Double(x2 - x), 2) + pow(Double(y2 - y), 2)))

            if r > distance1 && r > distance2{ continue }   //다음으로 갈 필요 없음 출발과 끝이 행성안에 있을 때 건너뜀
            
            if distance1 < r{   //출발정이 행성안에 있을 때
                count += 1
            }
            if distance2 < r{   //끝점이 행성안에 있을 때
                count += 1
            }

        }
        print(count)
    }

}

