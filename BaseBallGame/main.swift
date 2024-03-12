//
//  main.swift
//  BaseBallGame
//
//  Created by 쌩 on 3/12/24.
//

import Foundation

//class Input { // 인풋 컨트롤
//    var input01: [Int] = []
//    
//    func read() {
//        input01 = readLine()!.split(separator: " ").map { Int(String($0))!}
//        let input1 = readLine()!.split(separator: " ").map { String($0)}
//        let input2 = readLine()!.split(separator: " ").map { Int(String($0))!}
//    }
//}

class BaseBall { // 게임 컨트롤
    
//    let input = Input()
    func start() {
//        input.read()
//        print(input.input01)
        let answer = makeAnswer()
        print(answer)
    }
    
    func makeAnswer() -> Set<Int> {
        var numSet = Set<Int>()
        var firstNum = Int.random(in: 1...9)
        numSet.insert(firstNum)
        makeSecondNum()
        makeThirdNum()
        
        func makeSecondNum() {
            while numSet.count == 1 {
                numSet.insert( Int.random(in: 0...9))
            }
        }

        func makeThirdNum() {
            while numSet.count == 2 {
                numSet.insert( Int.random(in: 0...9))
            }
        }

        return numSet
    }
}

let baseball = BaseBall()
baseball.start()
