func quick3(){
    let n = Int(readLine()!)!
    var a = readLine()!.split(separator: " ").map { Int($0)! }
    let b = readLine()!.split(separator: " ").map { Int($0)! }
    var result = 0
    
    func quickSort(array: inout [Int], p: Int, r: Int) {
        if p >= r { return }
        if result == 1 { return }
        
        let q = partition(array: &array, p: p, r: r)
        
        quickSort(array: &array, p: p, r: q - 1)
        quickSort(array: &array, p: q + 1, r: r)
    }
    
    func partition(array: inout [Int], p: Int, r: Int) -> Int {
        var lo = p
        var hi = r
        let q = array[r]
        
        while lo < hi {
            while lo < hi && array[lo] < q {  lo += 1 }
            while lo < hi && array[hi] >= q { hi -= 1 }
            
            array.swapAt(lo, hi)
            compareArray(array: &array)
        }
        array.swapAt(hi, r)
        compareArray(array: &array)
        return hi
    }
    func compareArray(array: inout [Int]) {
        guard array == b else { return }
        result = 1
    }
    
    compareArray(array: &a)
    quickSort(array: &a, p: 0, r: n - 1)
    print(result)
}
quick3()