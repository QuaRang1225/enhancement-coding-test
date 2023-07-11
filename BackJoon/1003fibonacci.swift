//
//  Fibonacci.swift
//  BackJoon
//
//  Created by 유영웅 on 2023/07/11.
//

import Foundation
func fibonacci(){
    let T = Int(readLine()!)!
    var scan: [Int] = []

    for _ in 0..<T {
        scan.append(Int(readLine()!)!)
    }

    var arr: [(Int,Int)] = [(Int,Int)](repeating: (0,0), count: 41)
    arr[0] = (1,0)
    arr[1] = (0,1)

    for i in 2..<arr.count{
        arr[i] = (arr[i-1].1, arr[i-1].0 + arr[i-1].1)
    }

    for num in scan {
        print("\(arr[num].0) \(arr[num].1)")
    }
}

