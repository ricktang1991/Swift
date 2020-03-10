//
//  greedyAssignment.swift
//  SwiftXcode
//
//  Created by 桑染 on 2020-03-05.
//  Copyright © 2020 Rick. All rights reserved.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    var result = 0
    let cost = costs.sorted(by: { (a, b) -> Bool in return a[1] - a[0] > b[1] - b[0] })
    
    for i in 0..<cost.count {
        if i < cost.count / 2 {
            result += cost[i][0]
        } else {
            result += cost[i][1]
        }
    }
    return result
}

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    
    return 0
}


func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var diff = [Int]()
    for i in 0..<gas.count {
        diff.append(gas[i] - cost[i])
    }
    for i in 0..<gas.count {
        diff.append(diff[i])
    }
    var index = 0
    var remain = 0
    var count = 0
    func findIndex(answer: Int) -> Int {
        if count == gas.count {
            return answer
        } else {
            for i in answer..<gas.count + answer {
                remain += diff[i]
                print(i, remain, count)
                if answer < gas.count && remain < 0 {
                    remain = 0
                    count = 0
                    return findIndex(answer: answer + 1)

                }
                if answer < gas.count && remain >= 0 {
                    count += 1
                    if count == gas.count {
                        break
                    }
                    
                } else {
                    return -1
                }
            }
        }
        return answer
    }
    return findIndex(answer: index)
}


func partitionLabels(_ S: String) -> [Int] {
    var dict = [String:Int]()
    var result = [Int]()
        
    for i in 0..<S.count {
        dict[S[i]] = i
    }
        
    var start = 0, last = 0
        
    for index in 0..<S.count {
        last = max(last, dict[S[index]]!)
        if last == index {
            result.append(last - start + 1)
            start = last + 1
        }
    }
    return result
}


func scheduleCourse(_ courses: [[Int]]) -> Int {
    let course = courses.sorted(by: { (a, b) -> Bool in return a[1] < b[1] })
    print(course)
    var totalTime = 0
    var result = 0
    var list = course
    for i in 0..<course.count {
        if totalTime + course[i][0] <= course[i][1] {
            totalTime += course[i][0]
            result += 1
        } else {
            var maxDuration = i
            for j in 0..<i {
                if list[j][0] > list[maxDuration][0] {
                        maxDuration = j
                }
            }
            if list[maxDuration][0] > list[i][0] {
                totalTime += course[i][0] - course[maxDuration][0]
            }
            list[maxDuration][0] = -1
        }
    }
    return result
}
