var stack = [Int]()
var datas = [Int]()
var commands = [String]()

let n = Int(readLine()!)!
for _ in 0..<n{
    var c = readLine()!.split(separator: " ")
    if c.count > 1{  datas.append(Int(c.removeLast())!) }
    commands.append(String(c[0]))
}
for i in commands{
    var d = 0
    if i == "push"{ d = datas.removeFirst() }
    command(i,d)
}
func command(_ c:String,_ d:Int){
    switch c{
        case "push": stack.append(d)
        case "pop": print(!stack.isEmpty ? stack.removeLast() : -1)
        case "size": print(stack.count)
        case "empty": print(stack.isEmpty ? 1 : 0)
        case "top": print(stack.last ?? -1)
        default: break
    }
}
