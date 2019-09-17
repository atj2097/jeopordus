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
    

    @IBOutlet weak var answers: UIButton!
    var buttonid: Int?
    var modeChoice: String?
    var triviaInfo: Trivia?{
        didSet{
              Question.text = triviaInfo?.question
        }
    }
    



    
    @IBOutlet var buttonAnswers: [UIButton]!
    
    @IBAction func buttonAnswerAct(_ sender: Any) {
    }
    

    override func viewWillAppear(_ animated: Bool) {
        loadData(mode: modeChoice!, id: buttonid!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        Question.text = triviaInfo?.question


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
