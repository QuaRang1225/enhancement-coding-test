import UIKit
import Foundation

//func solution(_ wallpaper:[String]) -> [Int] {
//    
//    var wallpaper = wallpaper.map{Array($0).map{String($0)}}
//    
//    print(wallpaper)
//    
//    var start:[Int] = []
//    var end:[Int] = []
//    
//    for (indexY,y) in wallpaper.enumerated(){
//        if y.contains("#"){
//            start.append(indexY)
//        }
//        end.append(contentsOf: y.enumerated().filter{$0.element == "#"}.map{$0.offset})
//    }
//    let endSorted = end.sorted()
//    return [start.first ?? 0,(endSorted.first ?? 0), (start.last ?? 0) + 1,(endSorted.last ?? 0)+1]
//}

func solution(_ wallpaper:[String]) -> [Int] {
    
    var (lux,luy) = (51,51)
    var (rdx,rdy) = (-1,-1)
    
    wallpaper.enumerated().forEach { (indexY,y) in
        y.enumerated().forEach { (indexX,x) in
            if x == "#"{
                lux = min(lux, indexY)
                luy = min(luy, indexX)
                rdx = max(rdx, indexY)
                rdy = max(rdy, indexX)
            }
        }
    }
    return [lux,luy,rdx+1,rdy+1]
}

print(solution(    [".##...##.", "#..#.#..#", "#...#...#", ".#.....#.", "..#...#..", "...#.#...", "....#...."]    ))
