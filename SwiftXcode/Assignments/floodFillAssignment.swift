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
    // BFS
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

func shortestBridge() {
    struct Square {
        let x: Int
        let y: Int
    }
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    let n = Int(readLine()!)!
    
    var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var parent = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var group = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var shortestLength = 0
    var days = [Int]()
    
    var starts = [Square]()
    
    for i in 0..<n {
        let m = readLine()!.split(separator: " ")
        for j in 0..<n {
            let u = Int(m[j])!
            map[i][j] = u
        }
    }
    for i in 0..<n {
        for j in 0..<n {
            if map[i][j] == 1 {
                for d in 0..<4 {
                    let nj = j + dx[d]
                    let ni = i + dy[d]
                    if nj >= 0 && nj < n && ni >= 0 && ni < n {
                        if map[ni][nj] == 0 {
                            starts.append(Square(x: j, y: i))
                        }
                    }
                }
            }
        }
    }
    func bfs(x: Int, y: Int, id: Int, n: Int) {
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
                    if map[nx][ny] == 1 && group[nx][ny] == 0 {
                        q.enqueue(item: Square(x: nx, y: ny))
                        group[nx][ny] = id
                    }
                }
            }
        }
    }
    var id = 0
    for x in 0..<n {
        for y in 0..<n {
            if map[x][y] == 1 && group[x][y] == 0 {
                id += 1
                bfs(x: x, y: y, id: id, n: n)
            }
        }
    }
    // BFS
    let q = Queue<Square>()
    for i in starts {
        q.enqueue(item: i)
        parent[i.y][i.x] = 0
        visited[i.y][i.x] = true
    }
        
    outer: while !q.isEmpty() {
        let square = q.dequeue()!
        let x = square.x
        let y = square.y
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx >= 0 && nx < n && ny >= 0 && ny < n {
                if map[ny][nx] == 0 && visited[ny][nx] == false {
                    visited[ny][nx] = true
                    group[ny][nx] = group[y][x]
                    parent[ny][nx] = parent[y][x] + 1
                    q.enqueue(item: Square(x: nx, y: ny))
                    for i in 0..<n {
                        print(group[i])
                    }
                    print()
                } else if map[ny][nx] == 0 && visited[ny][nx] == true && group[ny][nx] != group[y][x] {
                    if group[ny][nx] != 0 {
                        if parent[y][x] != parent[ny][nx] {
                            shortestLength = parent[y][x] + parent[ny][nx]
                            days.append(shortestLength)
                        } else {
                            shortestLength = parent[ny][nx] * 2
                            days.append(shortestLength)
                        }
                    }
                }
            }
            
        }
    }
    shortestLength = days.min()!
    print(shortestLength)
}


    
