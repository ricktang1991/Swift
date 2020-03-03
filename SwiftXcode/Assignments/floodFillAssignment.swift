//
//  floodFillAssignment.swift
//  SwiftXcode
//
//  Created by 桑染 on 2020-03-02.
//  Copyright © 2020 Rick. All rights reserved.
//

import Foundation

func findDays() {
    struct Square {
        let x: Int
        let y: Int
    }
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    let input = readLine()!.split(separator: " ")
    let length = Int(input[0])!
    let width = Int(input[1])!
    var map = [[Int]](repeating: [Int](repeating: 0, count: length), count: width)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: length), count: width)
    var parent = [[Int]](repeating: [Int](repeating: 0, count: length), count: width)
    var days = 0
    var starts = [Square]()
    
    for i in 0..<width {
        let n = readLine()!.split(separator: " ")
        for j in 0..<length {
            let u = Int(n[j])!
            map[i][j] = u
            if map[i][j] == 1 {
                starts.append(Square(x: j, y: i))
            }
        }
    }
    let q = Queue<Square>()
    for i in starts {
        q.enqueue(item: i)
        visited[i.y][i.x] = true
    }
        
    while !q.isEmpty() {
        let square = q.dequeue()!
        let x = square.x
        let y = square.y
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx >= 0 && nx < length && ny >= 0 && ny < width {
                if map[ny][nx] == 0 && map[ny][nx] != -1 && visited[ny][nx] == false {
                    map[ny][nx] = 1
                    visited[ny][nx] = true
                    parent[ny][nx] = parent[y][x] + 1
                    q.enqueue(item: Square(x: nx, y: ny))
                }
            }
        }
        for k in 0..<width {
            print(map[k])
        }
        print()
    }
    outer: for i in 0..<width {
        inner: for j in 0..<length {
            if map[i][j] == 0 {
                days = -1
                break outer
            } else {
                if parent[i][j] > days {
                    days = parent[i][j]
                }
            }
        }
    }
    print(days)
}


    
