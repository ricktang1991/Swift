//
//  shortestPathAssignment.swift
//  SwiftXcode
//
//  Created by 桑染 on 2020-03-11.
//  Copyright © 2020 Rick. All rights reserved.
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
    struct Edge {
        let to: Int
        let weight: Int
    }
    var adj = [[Edge]](repeating: [], count: N + 1)
    var time = [Int](repeating: Int.max, count: N + 1)
    var check = [Bool](repeating: false, count: N + 1)
    time[0] = 0
    
    for i in 0..<times.count {
        let from = times[i][0]
        let to = times[i][1]
        let weight = times[i][2]
        adj[from].append(Edge(to: to, weight: weight))
    }
    
    time[K] = 0
    
    for _ in 0..<N - 1 {
        var min = Int.max
        var u = K
        for i in 1...N {
            if !check[i] && time[i] < min {
                min = time[i]
                u = i
            }
        }
        check[u] = true
        for edge in adj[u] {
            let v = edge.to
            if time[v] > time[u] + edge.weight {
                time[v] = time[u] + edge.weight
            }
        }
    }
    if time.contains(Int.max) {
        return -1
    }
    return time.max()!
}

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
    struct Edge {
        let to: Int
        let weight: Int
    }
    var adj = [[Edge]](repeating: [], count: n)
    var time = [Int](repeating: Int.max, count: n)
    
    for i in 0..<flights.count {
        let from = flights[i][0]
        let to = flights[i][1]
        let weight = flights[i][2]
        adj[from].append(Edge(to: to, weight: weight))
    }
    
    time[src] = 0
    
    for _ in 0..<K + 1 {
        var tempTime = time
        for i in 0..<n {
            for edge in adj[i] {
                let v = edge.to
                if time[i] == Int.max {
                    continue
                }
                if tempTime[v] > time[i] + edge.weight {
                    tempTime[v] = time[i] + edge.weight
                }
            }
        }
        time = tempTime
    }
    if time[dst] == Int.max {
        return -1
    }
    print(time[dst])
    return time[dst]
}
