//
//  GraphAssignment2.swift
//  SwiftXcode
//
//  Created by 桑染 on 2020-02-27.
//  Copyright © 2020 Rick. All rights reserved.
//

import Foundation

func leastRoads() {
    let n = readLine()!.split(separator: " ")
    let restaurtantsNum = Int(n[0])!
    let realNum = Int(n[1])!
    
    var realRestaurants = [Int]()
    let m = readLine()!.split(separator: " ")
    for i in 0..<realNum {
        realRestaurants.append(Int(m[i])!)
    }
    var adjList = [[Int]](repeating: [], count: restaurtantsNum + 1)
    for _ in 0..<restaurtantsNum - 1 {
        let edges = readLine()!.split(separator: " ")
        let u = Int(edges[0])!
        let v = Int(edges[1])!
        adjList[u].append(v)
        adjList[v].append(u)
        
    }
    var visited = [Bool](repeating: false, count: restaurtantsNum + 1)
    var distance = [Int](repeating: 0, count: restaurtantsNum)
    
    bfsDiameter(start: 0, visited: &visited, distance: &distance, adjList: &adjList)
    
    var start = 0
    
    for i in realRestaurants {
        if distance[i] > distance[start] {
            start = i
        }
    }
    var visited2 = [Bool](repeating: false, count: restaurtantsNum + 1)
    var distance2 = [Int](repeating: 0, count: restaurtantsNum)
    bfsDiameter(start: start, visited: &visited2, distance: &distance2, adjList: &adjList)
}

func bfsDiameter(start: Int, visited: inout [Bool], distance: inout [Int], adjList: inout [[Int]]) {
    let q = Queue<Int>()
    visited[start] = true
    q.enqueue(item: start)
    distance[start] = 0
    while !q.isEmpty() {
        let first = q.dequeue()!
        for i in adjList[first] {
            if visited[i] == false {
                distance[i] = distance[first] + 1
                q.enqueue(item: i)
                visited[i] = true
            }
            
        }
    }
}



