import UIKit

func solution(_ answers:[Int]) -> [Int] {
    
    var giveup = [(1,[1, 2, 3, 4, 5],0),(2,[2, 1, 2, 3, 2, 4, 2, 5],0),(3,[3, 3, 1, 1, 2, 2, 4, 4, 5, 5],0)]

    for i in (0..<answers.count){
        if giveup[0].1[i%giveup[0].1.count] == answers[i]{ giveup[0].2 += 1}
        if giveup[1].1[i%giveup[1].1.count] == answers[i]{ giveup[1].2 += 1}
        if giveup[2].1[i%giveup[2].1.count] == answers[i]{ giveup[2].2 += 1}
    }
    
    return giveup.filter{$0.2 == giveup.max(by: {$0.2 < $1.2})?.2}.map{$0.0}
}
print(solution(   [1,3,2,4,2]   ))
