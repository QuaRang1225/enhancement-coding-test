import UIKit

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var friendsInfo: [String: Int] = [:]
    for (index, friend) in friends.enumerated() {
        friendsInfo[friend] = index
    }
    
    //
    var giveGifts:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: friends.count),count: friends.count)
    var giftCount: [Int] = [Int](repeating: 0, count: friends.count)
    
    for gift in gifts {
        let giverReceiver = gift.components(separatedBy: " ")
        if let giver = giverReceiver.first, let receiver = giverReceiver.last {
            if let giverIndex = friendsInfo[giver], let receiverIndex = friendsInfo[receiver] {
                giveGifts[giverIndex][receiverIndex] += 1
                giftCount[giverIndex] += 1
                giftCount[receiverIndex] -= 1
            }
        }
    }
    var result = 0
    for giver in 0..<friends.count {
            var giftToReceive: Int = 0
            for receiver in 0..<friends.count where giver != receiver {
                if giveGifts[giver][receiver] > giveGifts[receiver][giver] || (giveGifts[giver][receiver] == giveGifts[receiver][giver] && giftCount[giver] > giftCount[receiver]) {
                    giftToReceive += 1
                }
            }
            result = max(result, giftToReceive)
        }
    return result
}

print(solution(["muzi", "ryan", "frodo", "neo"], ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]))
