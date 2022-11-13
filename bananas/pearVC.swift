//
//  pearVC.swift
//  bananas
//
//  Created by O'ral Nabiyev on 29/09/22.
//

import UIKit

struct Pear {
    var question1: Int
    var question2: Int
    var answer: [String]
    var trueVar: Int
}

class pearVC: UIViewController {
    
    @IBOutlet weak var paper: UIView!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var blackBack: UIView!
    @IBOutlet var pearImg1: [UIImageView]!
    @IBOutlet var varbtn: [UIButton]!
    @IBOutlet var pearImg2: [UIImageView]!
    
    
    
    var arrPear: [Pear] = [
        Pear(question1: 1, question2: 1, answer: ["2","3","4","5"], trueVar: 2),
        Pear(question1: 2, question2: 2, answer: ["2","1","4","5"], trueVar: 4),
        Pear(question1: 1, question2: 3, answer: ["2","6","4","5"], trueVar: 4),
        Pear(question1: 1, question2: 4, answer: ["2","3","4","5"], trueVar: 5),
        Pear(question1: 2, question2: 5, answer: ["2","7","5","6"], trueVar: 7),
        Pear(question1: 2, question2: 4, answer: ["2","3","6","5"], trueVar: 6),
        Pear(question1: 5, question2: 3, answer: ["2","8","10","5"], trueVar: 8),
        Pear(question1: 5, question2: 2, answer: ["2","7","4","5"], trueVar: 7),
        Pear(question1: 5, question2: 4, answer: ["8","3","9","10"], trueVar: 9),
        Pear(question1: 2, question2: 1, answer: ["2","3","4","5"], trueVar: 3),
    ]
    
    var currentQuestion: Int = 0
    var trueAnswer: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        blackBack.isHidden = true
        paper.isHidden = true
        
        for i in pearImg1 {
            i.isHidden = true
        }
        
        for i in pearImg2 {
            i.isHidden = true
        }
        
        setData()
    }
    
    
    func setData() {
        
        if currentQuestion == arrPear.count {
            return
        }
        
        result.text = "\(trueAnswer / 4) / \(arrPear.count)"
        
        for i in 0..<arrPear[currentQuestion].question1 {
            pearImg1[i].isHidden = false
        }
        
        for i in 0..<arrPear[currentQuestion].question2 {
            pearImg2[i].isHidden = false
        }
        
        for i in varbtn.enumerated() {
            i.element.setTitleColor(.white, for: .normal)
            i.element.setTitle(arrPear[currentQuestion].answer[i.offset], for: .normal)
            
        }
        
    }
    
    func findTrueAns() -> Int {
        
        for op in arrPear[currentQuestion].answer.enumerated() {
            if Int(op.element) == arrPear[currentQuestion].trueVar {
                return op.offset
            }
        }
        
        return 0
    }
    
    
    @IBAction func varTapped(_ sender: UIButton) {
        
        for btn in varbtn {
            if let title = sender.currentTitle {
                if title == "\(arrPear[currentQuestion].trueVar)" {
                    sender.setTitleColor(.green, for: .normal)
                    btn.isEnabled = false
                    trueAnswer += 1
                } else {
                    sender.setTitleColor(.red, for: .normal)
                    btn.isEnabled = false
                    let ind = findTrueAns()
                    varbtn[ind].setTitleColor(.green, for: .normal)
                }
            }
        }
        
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        currentQuestion += 1
        
        if currentQuestion == arrPear.count {
            blackBack.isHidden = false
            paper.isHidden = false
        }
        
        for btn in varbtn {
            btn.isEnabled = true
        }
        
        for i in pearImg1 {
            i.isHidden = true
        }
        
        for i in pearImg2 {
            i.isHidden = true
        }
        
        setData()
        
    }
    
    @IBAction func restartBtn(_ sender: Any) {
        currentQuestion = 0
        trueAnswer = 0
        viewDidLoad()
    }
    
    @IBAction func homebtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
