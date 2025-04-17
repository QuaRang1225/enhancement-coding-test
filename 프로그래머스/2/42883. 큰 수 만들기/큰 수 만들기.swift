import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var arr = [Character]()
    var k = k

    for i in number {
        while k > 0, let last = arr.last, last < i {
            arr.removeLast()
            k -= 1
        }
        arr.append(i)
    }
    return String(arr.prefix(number.count - k))
}