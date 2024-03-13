//
//  main.swift
//  BaseBallGame
//
//  Created by 쌩 on 3/12/24.
//

import Foundation

class Input { // 인풋 컨트롤
    var input01: Array<Int> = []
    
    func read() {
        input01 = readLine()!.split(separator: "").map { Int(String($0))!}

        
    }
    
    func checkGameNum() {
//        if input01 == ["q"] {
//            //quit
//        }
        
//        if input01
    }
    
    func checkMainMenu() {
        
    }
}

class BaseBall { // 게임 컨트롤
    
    let input = Input()
    func start() {
//        input.read()
//        print(input.input01)
        let answer = makeAnswer()
        
        
        checkAnswer(answer)
    }
    
    func makeAnswer() -> Array<Int> {
        var numSet = Set<Int>()
        var firstNum = Int.random(in: 1...9)
        var secondNum: Int = 0
        var thirdNum: Int = 0
        var numArray = Array<Int>()
        numSet.insert(firstNum)
        makeSecondNum()
        makeThirdNum()
        
        func makeSecondNum() {
            while numSet.count == 1 {
                secondNum = Int.random(in: 0...9)
                numSet.insert(secondNum)
            }
        }

        func makeThirdNum() {
            while numSet.count == 2 {
                thirdNum = Int.random(in: 0...9)
                numSet.insert(thirdNum)
            }
        }
        numArray = [firstNum, secondNum, thirdNum]
        return numArray
    }
    
    func checkAnswer(_ answer: Array<Int>) {
        input.read()
        let myArr: Array<Int> = input.input01
        print(myArr, answer)
        var ballCount: Int = 0
        var strikeCount: Int = 0
        var cnt: Int = 0
        var temp: Int = 0
        for i in 0...2 {
            if answer.contains(myArr[i]) {
                ballCount += 1
            }
            if answer[i] == myArr[i] {
                ballCount -= 1
                strikeCount += 1
            }
        }
        
        
        
        
        print(strikeCount, ballCount)
        if myArr == [0, 0, 0] {
            print("게임을 종료합니다.")
            return
        } else if strikeCount <= 2 {
            checkAnswer(answer)
        } else if strikeCount == 3 {
            print("축하합니다 정답입니다.")
        }
    }
}

let baseball = BaseBall()
baseball.start()
