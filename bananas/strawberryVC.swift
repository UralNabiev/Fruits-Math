//
//  strawberryVC.swift
//  bananas
//
//  Created by O'ral Nabiyev on 29/09/22.
//

import UIKit

struct Strawberry {
    var questionfirst: Int
    var questionsecond: Int
    var answers: [String]
    var trueAns: Int
}

class strawberryVC: UIViewController {
    
    @IBOutlet weak var paper: UIView!
    @IBOutlet weak var blackBlur: UIView!
    @IBOutlet weak var result: UILabel!
    @IBOutlet var strawImgFirst: [UIImageView]!
    @IBOutlet var strawImgSecond: [UIImageView]!
    @IBOutlet var varBtn: [UIButton]!
    
    var arrStrawberry: [Strawberry] = [
        Strawberry(questionfirst: 1, questionsecond: 1, answers: ["2","3","4","5"], trueAns: 2),
        Strawberry(questionfirst: 2, questionsecond: 2, answers: ["2","1","4","5"], trueAns: 4),
        Strawberry(questionfirst: 1, questionsecond: 3, answers: ["2","6","4","5"], trueAns: 4),
        Strawberry(questionfirst: 1, questionsecond: 4, answers: ["2","3","4","5"], trueAns: 5),
        Strawberry(questionfirst: 2, questionsecond: 5, answers: ["2","7","5","6"], trueAns: 7),
        Strawberry(questionfirst: 2, questionsecond: 4, answers: ["2","3","6","5"], trueAns: 6),
        Strawberry(questionfirst: 5, questionsecond: 3, answers: ["2","8","10","5"], trueAns: 8),
        Strawberry(questionfirst: 5, questionsecond: 2, answers: ["2","7","4","5"], trueAns: 7),
        Strawberry(questionfirst: 5, questionsecond: 4, answers: ["8","3","9","10"], trueAns: 9),
        Strawberry(questionfirst: 2, questionsecond: 1, answers: ["2","3","4","5"], trueAns: 3),
    ]
    
    var currentQues: Int = 0
    var trueAnswer: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        paper.isHidden = true
        blackBlur.isHidden = true
        
        for i in strawImgFirst {
            i.isHidden = true
        }
        
        for i in strawImgSecond {
            i.isHidden = true
        }
     
        setData()
    }
    
    func setData() {
        
        if currentQues == arrStrawberry.count {
            return
        }
        
        result.text = "\(trueAnswer / 4) / \(arrStrawberry.count)"
        
        for i in 0..<arrStrawberry[currentQues].questionfirst {
            strawImgFirst[i].isHidden = false
        }
        
        for i in 0..<arrStrawberry[currentQues].questionsecond {
            strawImgSecond[i].isHidden = false
        }
        
        for i in varBtn.enumerated() {
            i.element.setTitleColor(.white, for: .normal)
            i.element.setTitle(arrStrawberry[currentQues].answers[i.offset], for: .normal)
            
        }
        
    }
    
    
    
    func findTrueAns() -> Int {
        
        for op in arrStrawberry[currentQues].answers.enumerated() {
            if Int(op.element) == arrStrawberry[currentQues].trueAns {
                return op.offset
            }
        }
        
        return 0
    }
    
    
    @IBAction func varTap(_ sender: UIButton) {
        
        for btn in varBtn {
            if let title = sender.currentTitle {
                if title == "\(arrStrawberry[currentQues].trueAns)" {
                    sender.setTitleColor(.green, for: .normal)
                    btn.isEnabled = false
                    trueAnswer += 1
                } else {
                    btn.isEnabled = false
                    sender.setTitleColor(.red, for: .normal)
                    let ind = findTrueAns()
                    varBtn[ind].setTitleColor(.green, for: .normal)
                }
            }
        }
        
    }
    
   
    @IBAction func nextButton(_ sender: Any) {
        currentQues += 1
        
        if currentQues == arrStrawberry.count {
            paper.isHidden = false
            blackBlur.isHidden = false
        }
        
        for i in strawImgFirst {
            i.isHidden = true
        }
        
        for i in strawImgSecond {
            i.isHidden = true
        }
        
        for btn in varBtn {
            btn.isEnabled = true
        }
     
        setData()
    }
    
    @IBAction func restartTap(_ sender: Any) {
        currentQues = 0
        trueAnswer = 0
        viewDidLoad()
    }
    @IBAction func homeTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
