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
    
    var count = 10

        
    
    
//    func update() {
//        if(count > 0) {
//            countDownLabel.text = String(count-=1)
//        }
//    }
    override func viewWillAppear(_ animated: Bool) {
        loadData(mode: modeChoice!, id: buttonid!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        var timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
//        
        
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
