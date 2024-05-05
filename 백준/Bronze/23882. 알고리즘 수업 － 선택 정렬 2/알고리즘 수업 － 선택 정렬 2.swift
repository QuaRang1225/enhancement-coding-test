var input = readLine()!.split(separator: " ").map{Int($0)!}
var array = readLine()!.split(separator: " ").map{Int($0)!}

func selectSort(){
    let count = input[0]
    var end = 0
    guard count > 1 else {
        print(-1)
        return
    }
    for i in stride(from: count-1, to: 0, by: -1){
        let j = array.firstIndex(of: array[0..<i].max()!)!
        if array[i] < array[j]{
            array.swapAt(i, j)
            end += 1
            if end == input[1]{
                print(array.map{String($0)}.joined(separator: " "))
                return
            }
        }
        
    }
    if end < input[1]{
        print(-1)
        return
    }
}

selectSort()