//
//  floodFill.swift
//  SwiftXcode
//
//  Created by 桑染 on 2020-02-27.
//  Copyright © 2020 Rick. All rights reserved.
//

import Foundation


func Town() {
    struct Square {
        let x: Int
        let y: Int
    }
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    // town map (input)
    var townMap = [[Int]]()
    // group(colored)
    // (In Java, int[][] group = new int[25][25]
    var group = [[Int]](repeating: [Int](repeating: 0, count: 25), count: 25)
    
    func bfs(x: Int, y:Int, id: Int, n:Int) {
        let q = Queue<Square>()
        q.enqueue(item: Square(x: x, y: y))
        group[x][y] = id
        
        while !q.isEmpty() {
            let square = q.dequeue()!
            let x = square.x
            let y = square.y
            // check 4 directions
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                // check the bounds
                if nx >= 0 && nx < n && ny >= 0 && ny < n {
                    // check if there's a house and not yet marked in group
                    if townMap[nx][ny] == 1 && group[nx][ny] == 0 {
                        q.enqueue(item: Square(x: nx, y: ny))
                        group[nx][ny] = id
                    }
                }
            }
        }
    }
    // process the input
    let n = Int(readLine()!)! // n: town map size
    for _ in 0..<n {
        let row = readLine()!.map { Int(String($0))! }
        townMap.append(row)
    }
    
    var id = 0
    for x in 0..<n {
        for y in 0..<n {
            if townMap[x][y] == 1 && group[x][y] == 0 {
                id += 1
                bfs(x: x, y: y, id: id, n: n)
            }
        }
    }
    print(id) // how many groups? (how many ids)
    var answer = [Int](repeating: 0, count: 25 * 25)
    for i in 0..<n {
        for j in 0..<n {
            answer[group[i][j]] += 1
        }
    }
    answer = Array(answer[1...id])
    answer.sort()
    for i in 0..<id {
        print(answer[i])
    }
}
