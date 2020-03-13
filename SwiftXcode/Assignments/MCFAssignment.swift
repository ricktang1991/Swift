//
//  MCFAssignment.swift
//  SwiftXcode
//
//  Created by 桑染 on 2020-03-10.
//  Copyright © 2020 Rick. All rights reserved.
//

import Foundation

func findMCF() {
    struct Edge {
        let to: Int
        let weight: Int
    }
    
    let n = readLine()!.split(separator: " ")
    let N = Int(n[0])!
    let M = Int(n[1])!
    let D = Int(n[2])!
    
    var adj = [[Edge]](repeating: [], count: M + 1)
    var check = [Bool](repeating: false, count: N + 1)
    
    for _ in 0..<N - 1 {
        let m = readLine()!.split(separator: " ")
        let u = Int(m[0])!
        let v = Int(m[1])!
        let weight = Int(m[2])!
        adj[u].append(Edge(to: v, weight: weight))
        adj[v].append(Edge(to: u, weight: weight))
    }
    
}



