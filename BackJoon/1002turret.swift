//
//  turret.swift
//  BackJoon
//
//  Created by 유영웅 on 2023/07/11.
//

import Foundation

func turret(){
    let T = Int(readLine()!)!
    for _ in 0..<T{
        let l = readLine()!.split(separator: " ").map{Int(String($0))!} //" "로 구분하여 6개의 자연수 입력
        let (x1,y1,r1,x2,y2,r2) = (l[0],l[1],l[2],l[3],l[4],l[5])   //값 저장
        
        let distance = sqrt(Double((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2)))   //c^2 = a^2 + b^2
        
        if x1 == x2 && y1 == y2 && r1 == r2{ //좌표가 일치할경우 - 접점 무한대
            print(-1)
        }
        else if Double(abs(r2-r1)) < distance && distance < Double(r1 + r2){    //점점이 2개일 경우
            print(2)
        }
        else if Double(r1 + r2) == distance || distance == Double(abs(r1 - r2)){  //내점하거나 외접할 경우 - 점점 1개
            print(1)
        }
        else{       //접점이 없을 경우
            print(0)
        }
            
    }

}
