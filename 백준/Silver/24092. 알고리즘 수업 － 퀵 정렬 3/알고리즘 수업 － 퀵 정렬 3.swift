let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").compactMap{Int($0)}
var B = readLine()!.split(separator: " ").compactMap{Int($0)}
var flag = 0

func main() {
    // 입력 값 받기
    func quickSort(A: inout [Int], left: Int, right: Int) {
        if left >= right { return }
        if flag == 1 { return }
        
        let pivot = partition(A: &A, left: left, right: right)
        
        quickSort(A: &A, left: left, right: pivot - 1)
        quickSort(A: &A, left: pivot + 1, right: right)
    }
    
    func partition(A: inout [Int], left: Int, right: Int) -> Int {
        var lo = left
        var hi = right
        let pivot = A[right]
        
        while lo < hi {
            while lo < hi && A[lo] < pivot {  lo += 1 }
            while lo < hi && A[hi] >= pivot { hi -= 1 }
            
            A.swapAt(lo, hi)
            compareArray(A: &A)
        }
        A.swapAt(hi, right)
        compareArray(A: &A)
        return hi
    }
    func compareArray(A: inout [Int]) {
        guard A.elementsEqual(B) else { return }
        flag = 1
    }
    
    compareArray(A: &A)
    quickSort(A: &A, left: 0, right: N - 1)
    print(flag)
}
main()
