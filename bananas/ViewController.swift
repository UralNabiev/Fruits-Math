//
//  ViewController.swift
//  bananas
//
//  Created by O'ral Nabiyev on 25/09/22.
//

import UIKit

struct Bananas {
    var firstQuestion: Int
    var secondQuestion: Int
    var answer: [String]
    var trueAnswer: Int
}


class ViewController: UIViewController {

   
    @IBOutlet var bananaImage1: [UIImageView]!
    @IBOutlet var variantbtn: [UIButton]!
    @IBOutlet var bananaImage2: [UIImageView]!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var resultBtn: UILabel!
    @IBOutlet weak var blackBackground: UIView!
    @IBOutlet weak var paperResult: UIView!
    
    
    
    var arrQuestionCase: [Bananas] = [
        Bananas(firstQuestion: 1, secondQuestion: 1, answer: ["2","3","4","5"], trueAnswer: 2),
        Bananas(firstQuestion: 2, secondQuestion: 2, answer: ["2","1","4","5"], trueAnswer: 4),
        Bananas(firstQuestion: 1, secondQuestion: 3, answer: ["2","6","4","5"], trueAnswer: 4),
        Bananas(firstQuestion: 1, secondQuestion: 4, answer: ["2","3","4","5"], trueAnswer: 5),
        Bananas(firstQuestion: 2, secondQuestion: 5, answer: ["2","7","5","6"], trueAnswer: 7),
        Bananas(firstQuestion: 2, secondQuestion: 4, answer: ["2","3","6","5"], trueAnswer: 6),
        Bananas(firstQuestion: 5, secondQuestion: 3, answer: ["2","8","10","5"], trueAnswer: 8),
        Bananas(firstQuestion: 5, secondQuestion: 2, answer: ["2","7","4","5"], trueAnswer: 7),
        Bananas(firstQuestion: 5, secondQuestion: 4, answer: ["8","3","9","10"], trueAnswer: 9),
        Bananas(firstQuestion: 2, secondQuestion: 1, answer: ["2","3","4","5"], trueAnswer: 3),
    ]
    
    var currentQuestion: Int = 0
    var trueAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blackBackground.isHidden = true
        paperResult.isHidden = true
        
        for i in bananaImage1 {
            i.isHidden = true
        }
        
        for i in bananaImage2 {
            i.isHidden = true
        }
        setData()
        }
    
    func setData() {
        
        resultBtn.text = "\(trueAnswers) / \(arrQuestionCase.count)"
        
        if currentQuestion == arrQuestionCase.count {
//                blackBackground.isHidden = true
//                paperResult.isHidden = true
            return
        }
        
        for i in 0..<arrQuestionCase[currentQuestion].firstQuestion {
            bananaImage1[i].isHidden = false
        }
        
        for i in 0..<arrQuestionCase[currentQuestion].secondQuestion {
            bananaImage2[i].isHidden = false
        }
        
        for i in variantbtn.enumerated() {
            i.element.setTitleColor(.white, for: .normal)
//            arrQuestionCase[currentQuestion].answer[i.offset].shuffled()
            i.element.setTitle(arrQuestionCase[currentQuestion].answer[i.offset], for: .normal)
        }
        
    }
        
    

    func findTrueAns() -> Int {
        
        for op in arrQuestionCase[currentQuestion].answer.enumerated() {
            if Int(op.element) == arrQuestionCase[currentQuestion].trueAnswer {
                return op.offset
            }
        }
        
        return 0
    }
        
        
        
        @IBAction func btnTapped(_ sender: UIButton) {
        
            for btn in variantbtn {
                if let title = sender.currentTitle {
                    if title == "\(arrQuestionCase[currentQuestion].trueAnswer)" {
                        sender.setTitleColor(.green, for: .normal)
                        btn.isEnabled = false
                        trueAnswers += 1
                    } else {
                        sender.setTitleColor(.red, for: .normal)
                        btn.isEnabled = false
                        let ind = findTrueAns()
                        variantbtn[ind].setTitleColor(.green, for: .normal)
                    }
                }
            }
            
           
            
        }
     
    
    @IBAction func nextTapped(_ sender: Any) {
        currentQuestion += 1
        print("current= ", currentQuestion)
        
        if currentQuestion == arrQuestionCase.count {
            blackBackground.isHidden = false
            paperResult.isHidden = false
            nextBtn.isEnabled = false
            trueAnswers = trueAnswers/4
        }
        
        for btn in variantbtn {
            btn.isEnabled = true
        }
        
        for i in bananaImage1 {
            i.isHidden = true
        }
        
        for i in bananaImage2 {
            i.isHidden = true
        }
        
        setData()

    }
    
    @IBAction func restartTapped(_ sender: Any) {
        currentQuestion = 0
        trueAnswers = 0
        nextBtn.isEnabled = true
        blackBackground.isHidden = true
        paperResult.isHidden = true
        viewDidLoad()
        
        setData()
    }
    
    @IBAction func homeTapped(_ sender: Any) {
        blackBackground.isHidden = false
        paperResult.isHidden = false
        self.dismiss(animated: true)
    }
    
}

  

    
    



