//
//  main.swift
//  BaseBallGame
//
//  Created by 쌩 on 3/12/24.
//

import Foundation

class Input { /* 인풋 컨트롤.
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
                input01 = []
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
}

class BaseBall { // 게임 컨트롤
    
    private let input = Input()
    private var cnt: Int = 0
    private var cntArray: Array<Int> = []
    
    private func start() {
        print("""
              < 게임을 시작합니다 >
              숫자를 입력하세요
              """)
        let answer = makeAnswer()
        checkAnswer(answer)
    }
    
    private func makeAnswer() -> Array<Int> {
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
    
    private func checkAnswer(_ answer: Array<Int>) {
        input.read()
        let myArr: Array<Int> = input.input01
        if myArr.count == 0 {
            checkAnswer(answer)
        }
        else if myArr.count >= 4 {
            print("올바른 입력값을 넣어주세요.")
            checkAnswer(answer)
        } else if Array(Set(myArr)).count <= 2 {
            print("중복되지 않은 입력값을 넣어주세요.")
            checkAnswer(answer)
        }
        
        var ballCount: Int = 0
        var strikeCount: Int = 0
//        print(answer)   // 임시로 사용 할때만 주석 제거
        for i in 0...2 {
            if answer.contains(myArr[i]) {
                ballCount += 1
            }
            if answer[i] == myArr[i] {
                ballCount -= 1
                strikeCount += 1
            }
        }
        
      
        if strikeCount <= 2 {
            cnt += 1
            print("""
                \(cnt) 번째 시도
                Strike : \(strikeCount)   Ball : \(ballCount)
                """)
            checkAnswer(answer)
        } else if strikeCount == 3 {
            cnt += 1
            print("""
                \(cnt) 번째 시도
                축하합니다 정답입니다.
                메인 화면으로 돌아갑니다.
                """)
            cntArray.append(cnt)
            cnt = 0
            mainMenu()
        }
    }
    
    func mainMenu() {
        print("""
            환영합니다 원하시는 번호를 입력해주세요.
            1. 게임 시작  2. 게임 스코어 보기  3. 종료하기
            """)
        input.read()
        let myInputArr: Array<Int> = input.input01
        switch myInputArr[0] {
        case 1:
            start()
        case 2:
            gameScore()
        case 3:
            print("게임을 종료합니다.")
        default:
            print("올바르지 않은 입력값입니다.")
            mainMenu()
        }
    }
    
    func gameScore() {
        print("게임 스코어입니다.")
        if cntArray.count == 1 {print("1번째 게임 \(cntArray[0])회차 성공")
        } else  {
            for i in 1...cntArray.count {
                print("\(i)번째 게임 \(cntArray[i-1])회차 성공")
            }
        }
        print("메인 메뉴로 돌아갑니다.")
        mainMenu()
    }
}

let baseball = BaseBall()
baseball.mainMenu()
