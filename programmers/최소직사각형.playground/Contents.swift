import UIKit

func solution(_ sizes:[[Int]]) -> Int {
    var sortedSizes = sizes.map{$0.sorted(by:<)}
    return sortedSizes.map{$0[0]}.max()! * sortedSizes.map{$0[1]}.max()!
}
print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))
