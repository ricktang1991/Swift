//
//  DPAssignment.swift
//  SwiftXcode
//
//  Created by 桑染 on 2020-03-12.
//  Copyright © 2020 Rick. All rights reserved.
//

import Foundation

func climbStairs(_ n: Int) -> Int {
    var dp = [Int](repeating: 0, count: n + 1)
    if n == 1 {
        return 1
    }
    if n == 2 {
        return 2
    }
    dp[1] = 1
    dp[2] = 2
    for i in 3..<n + 1 {
        dp[i] = dp[i-1] + dp[i-2]
    }
    return dp[n]
}

func makeOne(_ x: Int) -> Int {
    var d = [Int](repeating: 0, count: x + 1)
    for i in 2...x {
        d[i] = d[i - 1] + 1
        if i % 2 == 0 && d[i] > d[i / 2] + 1 {
            d[i] = d[i / 2] + 1
        }
        if i % 3 == 0 && d[i] > d[i / 3] + 1 {
            d[i] = d[i / 3] + 1
        }
    }
    return d[x]
}

func twoNTiles() {
    let n = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: n + 1)
    if n == 1 {
        print("1")
    }
    if n == 2 {
        print("2")
    }
    dp[1] = 1
    dp[2] = 2
    for i in 3..<n + 1 {
        dp[i] = dp[i-1] + dp[i-2]
    }
    print(dp[n])
}

func twoNtilesTwo() {
    let n = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: n + 1)
    if n == 1 {
        print("1")
    }
    if n == 2 {
        print("3")
    }
    dp[1] = 1
    dp[2] = 3
    for i in 3..<n + 1 {
        dp[i] = dp[i-1] + 2 * dp[i-2]
    }
    print(dp[n])
}

func oneTwoThree() {
    let n = Int(readLine()!)!
    for _ in 0..<n {
        let m = Int(readLine()!)!
        var dp = [Int](repeating: 0, count: m + 1)
        if m == 1 {
            print("1")
        }
        if m == 2 {
            print("2")
        }
        if m == 3 {
            print("4")
        }
        dp[1] = 1
        dp[2] = 2
        dp[3] = 4
        for i in 4..<m + 1 {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
        }
        print(dp[m])
    }
}

func prettyNumber() {
    let n = Int(readLine()!)!
    
}

func nonDecreasingDigits() {
    let n = Int(readLine()!)!
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n)
    
    for i in 0..<10 {
        dp[0][i] = 1
    }
    for i in 1..<n {
        for j in 0..<10 {
            for l in 0..<10 {
                if l <= j && n > 1 {
                    dp[i][j] += dp[i-1][l]
                }
            }
            
        }
    }
    var result = 0
    for i in 0..<10 {
        result += dp[n-1][i]
    }
    print(result)
}
