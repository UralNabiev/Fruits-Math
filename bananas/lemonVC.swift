//
//  lemonVC.swift
//  bananas
//
//  Created by O'ral Nabiyev on 29/09/22.
//

import UIKit

struct Lemon {
    var question1: Int
    var question2: Int
    var answer: [String]
    var trueAnswers: Int
}

class lemonVC: UIViewController {
    
    @IBOutlet weak var ballLbl: UILabel!
    @IBOutlet weak var blackBack: UIView!
    @IBOutlet weak var paperBack: UIView!
    @IBOutlet var lemon1: [UIImageView]!
    @IBOutlet var lemon2: [UIImageView]!
    @IBOutlet var varLbl: [UIButton]!
    
    
    
    var arrLemon: [Lemon] = [
        Lemon(question1: 1, question2: 1, answer: ["2","3","4","5"], trueAnswers: 2),
        Lemon(question1: 2, question2: 2, answer: ["2","1","4","5"], trueAnswers: 4),
        Lemon(question1: 1, question2: 3, answer: ["2","6","4","5"], trueAnswers: 4),
        Lemon(question1: 1, question2: 4, answer: ["2","3","4","5"], trueAnswers: 5),
        Lemon(question1: 2, question2: 5, answer: ["2","7","5","6"], trueAnswers: 7),
        Lemon(question1: 2, question2: 4, answer: ["2","3","6","5"], trueAnswers: 6),
        Lemon(question1: 5, question2: 3, answer: ["2","8","10","5"], trueAnswers: 8),
        Lemon(question1: 5, question2: 2, answer: ["2","7","4","5"], trueAnswers: 7),
        Lemon(question1: 5, question2: 4, answer: ["8","3","9","10"], trueAnswers: 9),
        Lemon(question1: 2, question2: 1, answer: ["2","3","4","5"], trueAnswers: 3),
    ]
    
    var currentQ: Int = 0
    var trueA: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        blackBack.isHidden = true
        paperBack.isHidden = true
        
        
        for i in lemon1 {
            i.isHidden = true
        }
        
        for i in lemon2 {
            i.isHidden = true
        }

        
        setData()
    }
    
    
    func setData() {
        
        ballLbl.text = "\(trueA) / \(arrLemon.count)"
        
        if currentQ == arrLemon.count {
            return
        }
        
        for i in 0..<arrLemon[currentQ].question1 {
            lemon1[i].isHidden = false
        }
        
        for i in 0..<arrLemon[currentQ].question2 {
            lemon2[i].isHidden = false
        }
        
        for i in varLbl.enumerated() {
            i.element.setTitleColor(.white, for: .normal)
            i.element.setTitle(arrLemon[currentQ].answer[i.offset], for: .normal)
        }
        
        
    }
    
    
    func findTrueAns() -> Int {
        
        for op in arrLemon[currentQ].answer.enumerated() {
            if Int(op.element) == arrLemon[currentQ].trueAnswers {
                return op.offset
            }
        }
        
        return 0
    }
    
    
    @IBAction func varBtn(_ sender: UIButton) {
        
        for btn in varLbl {
            if let title = sender.currentTitle {
                if title == "\(arrLemon[currentQ].trueAnswers)" {
                    sender.setTitleColor(.green, for: .normal)
                    btn.isEnabled = false
                    trueA += 1
                } else {
                    sender.setTitleColor(.red, for: .normal)
                    btn.isEnabled = false
                    let ind = findTrueAns()
                    varLbl[ind].setTitleColor(.green, for: .normal)
                }
            }
        }
        
    }
    

    
    @IBAction func nextTapped(_ sender: Any) {
        
        currentQ += 1
        
        if currentQ == arrLemon.count {
            paperBack.isHidden = false
            blackBack.isHidden = false
            trueA = trueA/4
        }
        
        for btn in varLbl {
            btn.isEnabled = true
        }
        
        for i in lemon1 {
            i.isHidden = true
        }
        
        for i in lemon2 {
            i.isHidden = true
        }
        
        setData()
        
    }
    
    @IBAction func restart(_ sender: Any) {
        
        blackBack.isHidden = false
        paperBack.isHidden = false
        currentQ = 0
        trueA = 0
        viewDidLoad()
    }
    
    @IBAction func home(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
