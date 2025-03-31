import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let sum = (brown + yellow)
    var multiple = [[Int]]()
    for i in (2...Int(sqrt(Double(sum)))).reversed(){
        if (i*2) + ((sum/i - 2) * 2) == brown{
            return [sum/i,i]
        }
    }
    return []
}