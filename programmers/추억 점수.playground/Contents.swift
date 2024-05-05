import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    
    let scores = Dictionary(uniqueKeysWithValues: zip(name, yearning))
    return photo.map{ $0.compactMap{scores[$0]}.reduce(0, +) }
}

print(solution(["may", "kein", "kain", "radi"], [5, 10, 1, 3], [["may", "kein", "kain", "radi"],["may", "kein", "brin", "deny"], ["kon", "kain", "may", "coni"]]))
