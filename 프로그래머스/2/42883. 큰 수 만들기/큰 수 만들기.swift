import Foundation

func solution(_ number:String, _ k:Int) -> String {
        let numArr = number.compactMap{ $0.wholeNumberValue }
        var answer = [Int]()
        var k1 = k

        for i in 0..<number.count {
            while k1 > 0, !answer.isEmpty, answer.last! < numArr[i] {
                answer.removeLast()
                k1 -= 1
            }
            if k1 == 0 {
                answer.append(contentsOf: numArr[i...])
                break
            } else {
                answer.append(numArr[i])
            }
        }
        return String(answer.map{ String($0) }.joined().prefix(number.count-k))
    }