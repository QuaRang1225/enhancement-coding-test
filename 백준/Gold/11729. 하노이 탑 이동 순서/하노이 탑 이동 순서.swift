let input = Int(readLine()!)!
var arr = ""
var cnt = 0
func move(_ n:Int,_ from:Int,_ other:Int,_ to:Int){
    if n == 1 { 
        cnt += 1
        arr += "\(from) \(to)\n"
        return 
    }
    move(n-1, from, to, other)
    cnt += 1
    arr += "\(from) \(to)\n"
    move(n-1, other, from, to)

}

move(input,1,2,3)
print(cnt)
print(arr)