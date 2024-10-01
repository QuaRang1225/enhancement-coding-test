import Foundation
let input = readLine()!.split(separator: " ").compactMap{Int($0)}
let (n,r,c) = (input[0],input[1],input[2])
let d = [[0,0],[0,1],[1,0],[1,1]]

func move(_ n:Int,_ r:Int,_ c:Int)->Int{
    if n == 1 { return d.firstIndex(of: [r,c])! }
    var front = 0
    if inv(n)/2-1 >= r,inv(n)/2-1 >= c{ }
    else if inv(n)/2-1 >= r,inv(n)-1 >= c{ front = inv(2*(n-1))}
    else if inv(n)-1 >= r,inv(n)/2-1 >= c{ front = 2*(inv(2*(n-1)))}
    else if inv(n)-1 >= r,inv(n)-1 >= c{ front = 3*(inv(2*(n-1)))}

    var (r1,c1) = (0,0)
    r1 = (r >= inv(n-1) && r > 1) ? r - inv(n-1) : r
    c1 = (c >= inv(n-1) && c > 1) ? c - inv(n-1) : c
    return move(n-1, r1, c1) + front
}
func inv(_ n:Int)->Int{
    Int(pow(2, Double(n)))
}
print(move(n, r, c))