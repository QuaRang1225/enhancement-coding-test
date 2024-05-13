import Foundation

var N = 0, chance = 0, cnt = 0

func partition(_ arr: inout [Int], _ p: Int, _ r: Int) -> Int {
    var x, i, tmp: Int

    x = arr[r]
    i = p - 1
    for j in p..<r {
        if arr[j] <= x {
            i += 1
            tmp = arr[j]
            arr[j] = arr[i]
            arr[i] = tmp
            cnt += 1
            if cnt == chance {
                print("\(arr[i]) \(arr[j])")
                return -1
            }
        }
    }
    if i + 1 != r {
        tmp = arr[r]
        arr[r] = arr[i + 1]
        arr[i + 1] = tmp
        cnt += 1
        if cnt == chance {
            print("\(arr[i + 1]) \(arr[r])")
            return -1
        }
    }
    return i + 1
}

func quickSort(_ arr: inout [Int], _ p: Int, _ r: Int) {
    var q: Int
    if p < r {
        q = partition(&arr, p, r)
        if q == -1 {
            return
        }
        quickSort(&arr, p, q - 1)
        quickSort(&arr, q + 1, r)
    }
}

func main() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    N = input[0]
    chance = input[1]
    var arr = readLine()!.split(separator: " ").map { Int($0)! }

    quickSort(&arr, 0, N - 1)
    if cnt < chance {
        print(-1)
    }
}

main()
