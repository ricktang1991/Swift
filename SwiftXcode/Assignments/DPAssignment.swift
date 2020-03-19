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
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n + 1)
    if n == 1 {
        print("9")
    }
    if n >= 2 {
        for i in 1..<10 {
            dp[1][i] = 1
        }
        for i in 2...n {
            for j in 0..<10 {
                dp[i][j] = 0
                if j-1 >= 0 {
                    dp[i][j] += dp[i-1][j-1]
                }
                if j+1 <= 9 {
                    dp[i][j] += dp[i-1][j+1]
                }
            }
        }
        var answer = 0
        for i in 0..<10 {
            answer += dp[n][i]
        }
        print(answer)
    }
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

func lengthOfLIS(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var dp = [Int](repeating: 0, count: nums.count)
    dp[0] = 1
    var maxAns = 1
    for i in 0..<dp.count {
        var maxVal = 0
        for j in 0..<i {
            if nums[i] > nums[j] {
                maxVal = max(maxVal, dp[j])
            }
        }
        dp[i] = maxVal + 1
        maxAns = max(maxAns, dp[i])
    }
    print(dp)
    return maxAns
}

func judgeSquareSum(_ c: Int) -> Bool {
    var min = 0
    var max = Int(sqrt(Double(c)))
    while min * min + max * max != c && min <= max{
        if min * min + max * max > c {
            max -= 1
        } else {
            min += 1
        }
    }
    return min * min + max * max == c
}

func sumOfSquareNumbersTwo() {
    let n = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: n + 1)
    for i in 0..<n + 1 {
        dp[i] = i
        for j in 0...Int(sqrt(Double(i))) {
            dp[i] = min(dp[i], dp[i-j*j] + 1)
        }
    }
    print(dp[n])
}

func pokemon() {
    
    let n = readLine()!.split(separator: " ")
    let N = Int(n[0])!
    let M = Int(n[1])!
    var map = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    var dp = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    
    for y in 0..<N {
        let m = readLine()!.split(separator: " ")
        for x in 0..<M {
            map[y][x] = Int(m[x])!
        }
    }
    dp[0][0] = map[0][0]
    for i in 0..<N {
        for j in 0..<M {
            if i > 0 && j > 0 {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1]) + map[i][j]
            }
            else if i > 0 {
                dp[i][j] = dp[i-1][j] + map[i][j]
            }
            else if j > 0 {
                dp[i][j] = dp[i][j-1] + map[i][j]
            }
        }
    }
    print(dp[N-1][M-1])
}
        
        
func numDecodings(_ s: String) -> Int {
    var list = [String]()
    for i in 0..<s.count {
        list.append(s[i])
    }
    var count = 1
    if list.count == 1 {
        return 1
    }
    for n in 0..<list.count - 1{
        if Int(list[n] + list[n+1])! <= 26 {
            list.append(list[n]+list[n+1])
            count += 1
        }
    }
    return count
}

func maxSubArray(_ nums: [Int]) -> Int {
    var list = [Int]()
    for i in 0..<nums.count {
        var temp = nums[i]
        var max = temp
        for j in i+1..<nums.count {
            temp += nums[j]
            if temp > max {
                max = temp
            }
        }
        list.append(max)
    }
    return list.max()!
}
