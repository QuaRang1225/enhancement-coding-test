 let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let (mit,jisu,mod) = (input[0],input[1],input[2])
func cal(_ jisu:Int)->Int{
    guard jisu != 0 else { return 1 }
    let n = cal(jisu/2)
    return jisu % 2 == 0 ? n * n % mod : n * n % mod * mit % mod
}
print(cal(jisu))