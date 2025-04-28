import Foundation

func solution(_ id_list: [String], _ report: [String], _ k: Int) -> [Int] {
    
    var reported = Dictionary(uniqueKeysWithValues: id_list.map { ($0, 0) })  
    var reporter = id_list.map { ($0, 0) }
                        
    let report = Set(report)
    
    for i in report { 
        let d = i.split(separator: " ").last! 
        reported[String(d), default: 0] += 1   
    }
    
    reported = reported.filter { $0.value >= k }
    
    let graph = report.reduce(into: [String: [String]]()) {  
        let data = $1.split(separator: " ")
        $0[String(data[0]), default: []].append(String(data[1])) 
    }
    
    let result:[Int] = id_list.map { id in
        let reports = graph[id] ?? []
        return reports.filter { reported.keys.contains($0) }.count
    }
    
    return result
}