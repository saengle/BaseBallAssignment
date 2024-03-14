//
//  main.swift
//  BaseBallGame
//
//  Created by 쌩 on 3/12/24.
//

import Foundation

class Input { /* 인풋 컨트롤.  일단 스트링으로 받아와서 다 떨어트려서 세트화
               - 카운트로 개수 3개 아니면 잘못된거다 프린트, 다시실행.
               개수 3개 맞으면 세트로 0 - 9, 1 - 3 까지만 있는 배열에 넣고 숫자가 달라지면 잘못되었다.
               0000 은 특이케이스로 게임중에 먼저 입력받으면 게임 종료(메뉴로 복귀).
               ***** 밑에 이프 렛 이용해서 입력값을 받아오는건 성공인데, "quit" 이면 나가기(메인메뉴) 하고싶은데 어떻게 받고 확인하지 ?
               */
    var input01: Array<Int> = []
    
    func read() {
        if let input = readLine()
        {
            if let int = Int(input)
            {
                input01 = digits(int)
            } else {
                print("Entered input is \(input) of the type:\(type(of: input)), 올바른 입력값을 넣어주세요.")
            }
        }
    }
    
    private func digits(_ number: Int) -> [Int] {
        if number >= 10 {
            let firstDigits = digits(number / 10)
            let lastDigit = number % 10
            return firstDigits + [lastDigit]
        } else {
            return [number]
        }
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
        let answer = makeAnswer()
        checkAnswer(answer)
    }
    
    func makeAnswer() -> Array<Int> {
        var numSet = Set<Int>()
        let firstNum = Int.random(in: 1...9)
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
        if input.input01.count <= 2 {
            print("올바른 입력값을 넣어주세요.")
            checkAnswer(answer)
            return
        } else if Array(Set(input.input01)).count <= 2 {
            print("중복되지 않은 입력값을 넣어주세요.")
            checkAnswer(answer)
            return
        }
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
        
        print("Strike : \(strikeCount)   Ball : \(ballCount)")
        if strikeCount <= 2 {
            checkAnswer(answer)
        } else if strikeCount == 3 {
            print("축하합니다 정답입니다.")
        }
    }
}

let baseball = BaseBall()
baseball.start()
