//
//  JepViewController.swift
//  jeapordus
//
//  Created by God on 9/13/19.
//  Copyright © 2019 Jeapordus Team. All rights reserved.
//

import UIKit
import AVFoundation

class JepViewController: UIViewController {
   
    @IBOutlet weak var musicPlayer: UIButton!
    @IBAction func stopmusicButton(_ sender: UIButton) {
            MusicPlayer.shared.stopBackgroundMusic()
    }
    @IBOutlet weak var topicOne: UILabel!
    @IBOutlet weak var topicTwo: UILabel!
    @IBOutlet weak var randomTopic: UILabel!
    var currentUser: User!
    @IBOutlet var gameButtons: [UIButton]!
    var trivia: [Trivia]!
    
    
    @IBAction func buttonFunction(_ sender: UIButton) {
        let id = sender.tag
        var mode = ""
        switch sender.titleLabel?.text {
        case "$200":
             mode = "easy"
        case "$400":
             mode = "medium"
        case "$600":
             mode = "hard"
        default:
           "none"
        }

        
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let jeopDVC = storyboard.instantiateViewController(withIdentifier: "JeopDVC") as! JeopDVC
        
        let url = "https://opentdb.com/api.php?amount=10&category=\(id)&difficulty=\(mode)&type=multiple"
        jeopDVC.triviaInfo = trivia[0]
        navigationController?.pushViewController(jeopDVC, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = currentUser?.name
        musicPlayer.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 16)
        topicOne.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        topicTwo.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        randomTopic.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        musicPlayer.layer.borderColor = UIColor.white.cgColor
        for buttons in gameButtons {
            buttons.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        }
        

        
    }

     func loadData(url: String){
        TriviaWrapper.fetchTriviaData(Url: url){ (result) in
            DispatchQueue.main.async {
                
                
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let triviaData):
                    
                    return self.trivia = triviaData
                }
            }
        }
    

//    private func loadData(){
//        TriviaWrapper.fetchTriviaData{ (result) in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let triviaData):
//                DispatchQueue.main.async{
//                    return self.trivia = triviaData
//                }
//            }
//        }
//    }
    
    



    
//
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let showVc = segue.destination as? EpisodeViewController else {
//            fatalError("Unexpected segue")
//        }
//        guard let selectedIndexPath = showTableVIew.indexPathForSelectedRow
//            else { fatalError("No row selected") }
//
//    }


//TODO: -- add function to get data

}
    


}


