import Foundation

func solution(_ n:Int, _ w:Int, _ num:Int) -> Int {
    var result = 0
    let array = makeArray(n, w)
    let (row, column) = makeRowOfRow(array, num, w)
    
    for arr in array.reversed() {
        guard arr[column] > 0 else { continue }
        result += 1
        if arr[column] == num {
            break
        } 
    }
    return result
}

/// 2차원 배열 생성
private func makeArray(_ last: Int, _ w: Int) -> [[Int]] {
    var index = 1
    var right = true
    var array = [[Int]]()
    
    while index <= last {
        let rowLast = min(index + w - 1, last)
        var arr = right ? Array(index...rowLast) : Array(stride(from: rowLast, through: index, by: -1))
        if arr.count < w {
            if right {
                arr = arr + Array(repeating: -1, count: w - arr.count)
            } else {
                arr = Array(repeating: -1, count: w - arr.count) + arr
            }
        }
        array.append(arr)
        right.toggle()
        index += w
    }
    
    return array
}

/// 행, 열 반환 (수정됨)
private func makeRowOfRow(_ array: [[Int]], _ num: Int, _ w: Int) -> (Int, Int) {
    for (rowIndex, row) in array.enumerated() {
        if let colIndex = row.firstIndex(of: num) {
            return (rowIndex, colIndex)
        }
    }
    return (0, 0)
}

// 1에서 n까지 총 w로 2차원 배열 생성
// 정방향 -> 역방향 -> 정방향 순으로 배열 저장 방식 교체

// 모두 저장 시 
// [
//     [1,2,3,4,5,6],
//     [12,11,10,9,8,7],
//     [13,14,15,16,17,18],
//     [19,20,21,22]
// ]
// num이 있는 행 = num%w, num이 있는 열 = 특정 행의 n을 가진 index
// 배열을 역순으로 for문을 돌리며 num%w의

// 특이사항 빈 곳은 -1로 채움