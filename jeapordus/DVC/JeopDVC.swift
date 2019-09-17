//
//  JeopDVC.swift
//  jeapordus
//
//  Created by God on 9/13/19.
//  Copyright © 2019 Jeapordus Team. All rights reserved.
//

import UIKit

class JeopDVC: UIViewController {
    
    
    @IBOutlet weak var Question: UITextView!
    var delegate: passData?
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

    
    @IBOutlet var buttonAnswers: [UIButton]!
    @IBAction func buttonAnswerAct(_ sender: UIButton) {
        if sender.titleLabel?.text == triviaInfo?.correctAnswer{
            sender.setImage(UIImage(named: "check"), for: .normal)
            delegate?.UserData(data: "+")
        }else{
             sender.setImage(UIImage(named: "wrong"), for: .normal)
            delegate?.UserData(data: "-")
        }
         self.navigationController?.popViewController(animated: true)
}
    
    
    
    @IBOutlet var countDownLabel: UILabel!
    

    var countTimer:Timer!

    var count = 10

    
    var counter = 30
 
    @objc func updateCounter() {
        //example functionality
        if counter > -1 {
            countDownLabel.text = "\(counter) seconds"
            counter -= 1
        }
            
        else {
            _ = navigationController?.popViewController(animated: true)
            
        }
    }

    
    //    func update() {
    //        if(count > 0) {
    //            countDownLabel.text = String(count-=1)
    //        }
    //    }
    

    override func viewWillAppear(_ animated: Bool) {
        loadData(mode: modeChoice!, id: buttonid!)
   
        super.viewWillAppear(animated)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

    countDownLabel.font = UIFont(name: "MarkerFelt-Wide", size: 30)

    

        
        Question.text = triviaInfo?.question
        //        var timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        //


        
        Question.text = triviaInfo?.question
        Question.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        for buttons in buttonAnswers {
            buttons.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        }
        
        // Do any additional setup after loading the view.
        
    }
    func setUpButtons(){
        for (k,v) in shuffledAnswers.enumerated(){
            buttonAnswers[k].setTitle(v, for: .normal)
    
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

protocol passData {
    func UserData(data: String)
}
