let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    let (n,m) = (input[0],input[1])
    var arr = [Int]()
    
    func dfs(){
        if arr.count == m{
            print(arr.map{String($0)}.joined(separator: " "))
            return
        }
        for i in 1...n{
            if !arr.contains(i){
                arr.append(i)
                dfs()
                arr.removeLast()
            }
        }
    }
    dfs()