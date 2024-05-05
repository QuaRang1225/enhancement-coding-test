import UIKit

func solution(_ clothes:[[String]]) -> Int {
    
    var clothesDict = [String:Int]()
    clothes.forEach { cloth in
        clothesDict[cloth[1] , default : 0] += 1
    }
    return clothesDict.map{$0.value + 1}.reduce(1, *) - 1
}

print(solution(  [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]       ))
print(solution(  [["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]       ))
