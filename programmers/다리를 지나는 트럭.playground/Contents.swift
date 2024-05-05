import UIKit


func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucks = truck_weights
    var bridge = [Int](repeating: 0, count: bridge_length)
    var bridgeWeight = 0
    var cnt = 0
    
    while !bridge.isEmpty{
        cnt += 1
        bridgeWeight -= bridge.removeFirst()
        
        guard let first = trucks.first else {continue}
        if first + bridgeWeight <= weight{
            bridge.append(first)
            bridgeWeight += trucks.removeFirst()
        }else{
            bridge.append(0)
        }
    }
    return cnt
}

print(solution(  100  , 100 ,  [10,10,10,10,10,10,10,10,10,10]  ))


