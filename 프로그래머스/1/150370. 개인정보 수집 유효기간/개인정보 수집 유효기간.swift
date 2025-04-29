import Foundation

func solution(_ today: String, _ terms: [String], _ privacies: [String]) -> [Int] {
    var nums = [Int]()
    let todayDate = toDate(today)
    
    // terms 딕셔너리 만들기 (약관 종류: 기간(개월))
    let termsDict: [String: Int] = Dictionary(uniqueKeysWithValues: terms.map {
    let d = $0.split(separator: " ")
    return (String(d[0]), Int(d[1])!)
})
    
    // privacies를 (날짜, 약관 종류)로 파싱
    let privaciesTuple: [(Date, String)] = privacies.map {
    let d = $0.split(separator: " ")
    return (toDate(String(d[0])), String(d[1]))
    }
    
    for (i, (privacyDate, termType)) in privaciesTuple.enumerated() {
        if let termMonths = termsDict[termType],
           let expiryDate = Calendar.current.date(byAdding: .month, value: termMonths, to: privacyDate) {
            
            if expiryDate <= todayDate {
                nums.append(i + 1) // 문제에서는 인덱스가 1부터 시작
            }
        }
    }
    
    return nums
}

func toDate(_ string: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd"
    formatter.timeZone = TimeZone(abbreviation: "UTC") // 타임존 지정해줘야 안전
    return formatter.date(from: string)!
}