//
//  graphAssignment.swift
//  SwiftXcode
//
//  Created by 桑染 on 2020-03-01.
//  Copyright © 2020 Rick. All rights reserved.
//

import Foundation

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

extension StringProtocol  {
    var digits: [Int] { compactMap{ $0.wholeNumberValue } }
}
extension LosslessStringConvertible {
    var string: String { .init(self) }
}
extension Numeric where Self: LosslessStringConvertible {
    var digits: [Int] { string.digits }
}


func findCycles() {
    let n = Int(readLine()!)!
    
    for _ in 0..<n {
        let m = Int(readLine()!)!
        
        var list = UF(m)
        let set = readLine()!.split(separator: " ")
        
        for i in 0..<m {
            let u = Int(set[i])! - 1
            list.union(i, u)
        }
        print(list.count)
    }
}

func uniqueSequence() {
    let n = readLine()!.split(separator: " ")
    var num = Int(n[0])!
    let power = Int(n[1])!
    
    var list = [Int]()
    var visited = [Bool](repeating: false, count: 10000)
    
    func getNext(number: Int) -> Int{
        let digits = num.digits
        var next = 0
        for i in digits {
            next += i ^^ power
        }
        return next
    }
    
    while visited[num] == false {
        list.append(num)
        visited[num] = true
        num = getNext(number: num)
    }
    
    for i in 0..<list.count {
        if list[i] == num {
            list.removeSubrange(i..<list.count)
            break
        }
    }
    print(list.count)
    
}



