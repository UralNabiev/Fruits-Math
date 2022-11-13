//
//  appleVC.swift
//  bananas
//
//  Created by O'ral Nabiyev on 29/09/22.
//

import UIKit

struct Apple {
    var questionFirst: Int
    var questionSecond: Int
    var answers: [String]
    var trueAnswers: Int
}

class appleVC: UIViewController {
    
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var blackBackground: UIView!
    @IBOutlet var applefirstImg: [UIImageView]!
    @IBOutlet var applesecondImg: [UIImageView]!
    @IBOutlet var variantsBtn: [UIButton]!
    @IBOutlet weak var paper: UIView!
    
    
    

    var arrApple: [Apple] = [
        Apple(questionFirst: 1, questionSecond: 1, answers: ["2","3","4","5"], trueAnswers: 2),
        Apple(questionFirst: 2, questionSecond: 2, answers: ["2","1","4","5"], trueAnswers: 4),
        Apple(questionFirst: 1, questionSecond: 3, answers: ["2","6","4","5"], trueAnswers: 4),
        Apple(questionFirst: 1, questionSecond: 4, answers: ["2","3","4","5"], trueAnswers: 5),
        Apple(questionFirst: 2, questionSecond: 5, answers: ["2","7","5","6"], trueAnswers: 7),
        Apple(questionFirst: 2, questionSecond: 4, answers: ["2","3","6","5"], trueAnswers: 6),
        Apple(questionFirst: 5, questionSecond: 3, answers: ["2","8","10","5"], trueAnswers: 8),
        Apple(questionFirst: 5, questionSecond: 2, answers: ["2","7","4","5"], trueAnswers: 7),
        Apple(questionFirst: 5, questionSecond: 4, answers: ["8","3","9","10"], trueAnswers: 9),
        Apple(questionFirst: 2, questionSecond: 1, answers: ["2","3","4","5"], trueAnswers: 3),
    ]
    
    var currents: Int = 0
    var trueAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        blackBackground.isHidden = true
        paper.isHidden = true
        
        for i in applesecondImg {
            i.isHidden = true
        }
        
        for i in applefirstImg {
            i.isHidden = true
        }
        setData()
 
    }
    
    func setData() {
        
        resultLbl.text = "\(trueAnswer) / \(arrApple.count)"
        
        if currents == arrApple.count {
//                blackBackground.isHidden = true
//                paperResult.isHidden = true
            return
        }
        
        for i in 0..<arrApple[currents].questionFirst {
            applefirstImg[i].isHidden = false
        }
        
        for i in 0..<arrApple[currents].questionSecond {
            applesecondImg[i].isHidden = false
        }
        
        for i in variantsBtn.enumerated() {
            i.element.setTitleColor(.white, for: .normal)
//            arrApple[currents].answers[i.offset]
            i.element.setTitle(arrApple[currents].answers[i.offset], for: .normal)
        }
    }
    
    func findTrueAns() -> Int {
        
        for op in arrApple[currents].answers.enumerated() {
            if Int(op.element) == arrApple[currents].trueAnswers {
                return op.offset
            }
        }
        
        return 0
    }
    
    @IBAction func varTapped(_ sender: UIButton) {
        
        for btn in variantsBtn {
            if let title = sender.currentTitle {
                if title == "\(arrApple[currents].trueAnswers)" {
                    sender.setTitleColor(.green, for: .normal)
                    btn.isEnabled = false
                    trueAnswer += 1
                } else {
                    sender.setTitleColor(.red, for: .normal)
                    btn.isEnabled = false
                    let ind = findTrueAns()
                    variantsBtn[ind].setTitleColor(.green, for: .normal)
                }
            }
        }
        
    }
    
    
    @IBAction func nextTapped(_ sender: Any) {
        
        currents += 1
        
        if currents == arrApple.count {
            blackBackground.isHidden = false
            paper.isHidden = false
            trueAnswer = trueAnswer / 4
        }
        
        for btn in variantsBtn {
            btn.isEnabled = true
        }
        
        for i in applefirstImg {
            i.isHidden = true
        }
        
        for i in applesecondImg {
            i.isHidden = true
        }
        
        setData()
        
    }
    
    
    @IBAction func restartTapped(_ sender: Any) {
        currents = 0
        trueAnswer = 0
        viewDidLoad()
        
        
    }
    
    @IBAction func hometapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
