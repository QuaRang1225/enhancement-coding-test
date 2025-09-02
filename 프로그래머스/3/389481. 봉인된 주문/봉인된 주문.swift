import Foundation

func solution(_ n: Int64, _ bans: [String]) -> String {
    let nums = bans.map { spellToNumber($0) }
    let spellNumber = processArray(Int(n), nums)
    return numberToSpell(spellNumber)
}
// 주문이 몇번째인지 출력하는 메서드 
func spellToNumber(_ s: String) -> Int {
    var result = 0
    for ch in s {
        let value = Int(ch.asciiValue! - Character("a").asciiValue! + 1)
        result = result * 26 + value
    }
    
    return result
}
// 순서를 주문으로 변환하는 메서드
func numberToSpell(_ num: Int) -> String {
    var num = num
    var result = ""

    while num > 0 {
        num -= 1  // 보정: a = 1이므로
        let char = Character(UnicodeScalar(num % 26 + Int(Character("a").asciiValue!))!)
        result.insert(char, at: result.startIndex)
        num /= 26
    }
    
    return result
}
// 배열을 검사 해 n의 원래 위치를 계산하는 메서드
func processArray(_ n: Int, _ arr: [Int]) -> Int {
    var n = n
    for value in arr.sorted() {
        if value <= n {
            n += 1
        }
    }
    return n
}

// a~z : 26^1 = 1~26
// aa~zz: 26^2 = 27~676
// aaa~zzz: 26^3 = 677~17576
// -> 일일히 세보는건 정답이 아닐 것임

// a -> 1 
// aa -> 27 = 26+1
// bb -> 53 = (26*2) + 2
// aaa -> 677 = (26^3) + 1
// gqk -> ((26^3)*7) + (26^2)*17 + 11
// 자리수 = digit, 순서 = sequnece

// 필요한 것
// 1. 알파벳을 숫자로 연결하는 매핑된 딕셔너리
// 2. 주문이 몇번째인지 출력하는 메서드 
// 3. bans를 모두 정수로 변환
// 4. 배열을 순회하며 n보다 작은 숫자가 있을 때마다 1씩 증가시키는 순회 메서드 

