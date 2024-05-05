import UIKit

func solution(_ s:String) -> Bool
{
    
    var arr = Array(s)
    var openStacks = 0
    var closeStacks = 0
    var check = true

    for paren in arr {
        if openStacks < closeStacks {
            check = false
            break
        }
        if paren == "("{
            openStacks += 1
        }else{
            closeStacks += 1
        }
    }
    return openStacks != closeStacks ? false : check
}
print(solution(   "(()("     ))
