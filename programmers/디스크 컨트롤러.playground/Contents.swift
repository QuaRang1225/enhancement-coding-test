import UIKit

func solution(_ jobs:[[Int]]) -> Int {
    
    
    var sortedJobs = jobs.sorted{
        if $0[0] == $1[0]{
            return $0[1] < $1[1]
        }else if $0[1] == $1[1]{
            return $0[0] < $1[0]
        }else{
            return $0[1] < $1[1]
        }
    }
    
    var task = 0
    var total = 0
    
    while sortedJobs.count > 0 {
        for i in 0..<sortedJobs.count {
            
            if sortedJobs[i][0] <= task {
                task += sortedJobs[i][1]
                total += task - sortedJobs[i][0]
                sortedJobs.remove(at: i)
                break
            }
            if i == sortedJobs.count - 1 {
                task += 1
                print(task)
            }
            
        }
    }
    return total / jobs.count
}
print(solution(     [[0, 10], [1, 28], [2, 6],[3,4],[4,14]]  ))


//[[0, 10], [1, 28], [2, 6],[3,4],[4,14]]
