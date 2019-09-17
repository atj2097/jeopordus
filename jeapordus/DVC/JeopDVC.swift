//
//  JeopDVC.swift
//  jeapordus
//
//  Created by God on 9/13/19.
//  Copyright © 2019 Jeapordus Team. All rights reserved.
//

import UIKit

class JeopDVC: UIViewController {
<<<<<<< HEAD
    
    @IBOutlet weak var Question: UITextView!
    @IBOutlet weak var answers: UIButton!
=======

    @IBOutlet weak var Question: UITextView!
    @IBOutlet var buttonAnswers: [UIButton]!
    

>>>>>>> 04bb83f9ed32840957b382ed49dc1e9cd3619d2f
    var buttonid: Int?
    var modeChoice: String?
    var shuffledAnswers = [String]()
    var triviaInfo: Trivia?{
        didSet{
            Question.text = triviaInfo?.question.removingPercentEncoding
            shuffledAnswers = (self.triviaInfo?.answersShuffle())!
            setUpButtons()
        }
    }
    
    
<<<<<<< HEAD
    @IBOutlet var buttonAnswers: [UIButton]!
    @IBAction func buttonAnswerAct(_ sender: UIButton) {
        print(sender.titleLabel?.text)
        print(buttonAnswers.count)
    }
=======

    
    @IBAction func buttonAnswerAct(_ sender: Any) {
    }
    
    @IBOutlet var countDownLabel: UILabel!
    
    var count = 10

        
    
    
//    func update() {
//        if(count > 0) {
//            countDownLabel.text = String(count-=1)
//        }
//    }
>>>>>>> 04bb83f9ed32840957b382ed49dc1e9cd3619d2f
    override func viewWillAppear(_ animated: Bool) {
        loadData(mode: modeChoice!, id: buttonid!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        Question.text = triviaInfo?.question
=======
//        var timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
//        
        
        Question.text = triviaInfo?.question
        Question.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        for buttons in buttonAnswers {
            buttons.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        }

        // Do any additional setup after loading the view.

>>>>>>> 04bb83f9ed32840957b382ed49dc1e9cd3619d2f
    }
    func setUpButtons(){
        for (k,v) in shuffledAnswers.enumerated(){
            print("\(k)im k")
            buttonAnswers[k].setTitle(v, for: .normal)
            print("\(v)im v")
         
        }
    }
    
    
    private func loadData(mode: String, id: Int){
        TriviaWrapper.fetchTriviaData(mode: mode, id: id){ (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let triviaData):
                    dump(triviaData)
                    return self.triviaInfo = triviaData
                }
            }
        }
    }
    
}
