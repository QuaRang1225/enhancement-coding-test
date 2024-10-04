func stack(){
    let stack = Stack()
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
        case "push": stack.push(d)
        case "pop": print(stack.pop)
        case "size": print(stack.size)
        case "empty": print(stack.empty)
        case "top": print(stack.top)
        default: break
        }
    }
}
class Stack{
    var stack = [Int]()
    var empty:Int{
        stack.isEmpty ? 1 : 0
    }
    var top:Int{
        stack.last ?? -1
    }
    var size:Int{
        stack.count
    }
    func push(_ num:Int){
        stack.append(num)
    }
    var pop:Int{
        !stack.isEmpty ? stack.removeLast() : -1
    }
}
stack()