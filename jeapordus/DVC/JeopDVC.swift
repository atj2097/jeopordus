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
    @IBOutlet var buttonAnswers: [UIButton]!
    

    var buttonid: Int?
    var modeChoice: String?
    var triviaInfo: Trivia?{
        didSet{
              Question.text = triviaInfo?.question
        }
    }

    
    @IBAction func buttonAnswerAct(_ sender: Any) {
    }
    
    @IBOutlet var countDownLabel: UILabel!
    
    var countTimer:Timer!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        loadData(mode: modeChoice!, id: buttonid!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    
        
        Question.text = triviaInfo?.question
        Question.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        for buttons in buttonAnswers {
            buttons.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        }

        // Do any additional setup after loading the view.

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
