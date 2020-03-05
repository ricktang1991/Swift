//
//  TopologicalSort.swift
//  SwiftXcode
//
//  Created by 桑染 on 2020-03-05.
//  Copyright © 2020 Rick. All rights reserved.
//

import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var adjList = [[Int]](repeating: [Int](), count: numCourses)
    var indegree = [Int](repeating: 0, count: numCourses)
    var courses = 0
    
    for i in 0..<prerequisites.count {
        let tryToTake = prerequisites[i][0]
        let required = prerequisites[i][1]
        adjList[required].append(tryToTake)
        indegree[tryToTake] += 1
    }
    // topological sort
    let q = Queue<Int>()
    // initial state
    for v in 0..<indegree.count {
        if indegree[v] == 0 {
            q.enqueue(item: v)
        }
    }
    
    // BFS
    while !q.isEmpty() {
        let x = q.dequeue()!
        courses += 1
        for v in adjList[x] {
            indegree[v] -= 1 // decrement indegree
            if indegree[v] == 0 {
                q.enqueue(item: v)
            }
        }
    }
    return courses == numCourses
}

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var adjList = [[Int]](repeating: [Int](), count: numCourses)
    var indegree = [Int](repeating: 0, count: numCourses)
    var answer = [Int]()
    
    for i in 0..<prerequisites.count {
        let tryToTake = prerequisites[i][0]
        let required = prerequisites[i][1]
        adjList[required].append(tryToTake)
        indegree[tryToTake] += 1
        
    }
    // topological sort
    let q = Queue<Int>()
    // initial state
    for v in 0..<indegree.count {
        if indegree[v] == 0 {
            q.enqueue(item: v)
        }
    }
    // BFS
    while !q.isEmpty() {
        let x = q.dequeue()!
        answer.append(x)
        for v in adjList[x] {
            indegree[v] -= 1 // decrement indegree
            if indegree[v] == 0 {
                q.enqueue(item: v)
            }
        }
    }
    return answer
}
