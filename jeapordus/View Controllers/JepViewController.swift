//
//  JepViewController.swift
//  jeapordus
//
//  Created by God on 9/13/19.
//  Copyright © 2019 Jeapordus Team. All rights reserved.
//

import UIKit

class JepViewController: UIViewController {
    @IBOutlet weak var topicOne: UILabel!
    @IBOutlet weak var topicTwo: UILabel!
    @IBOutlet weak var randomTopic: UILabel!
    var currentUser: User?
    @IBOutlet var gameButtons: [UIButton]!
    
    
    @IBAction func buttonFunction(_ sender: UIButton) {
        var url = "https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple"
        var id = sender.tag
        var mode = ""
        switch sender.titleLabel?.text {
        case "$200":
        return mode = "easy"
        case "$400":
        return mode = "medium"
        case "$600":
        return   mode = "hard"
        default:
            "bla"
        }
        url = "https://opentdb.com/api.php?amount=10&category=\(id)&difficulty=easy&type=multiple"
        loadData()
    }
    
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let showVc = segue.destination as? EpisodeViewController else {
//            fatalError("Unexpected segue")
//        }
//        guard let selectedIndexPath = showTableVIew.indexPathForSelectedRow
//            else { fatalError("No row selected") }
//
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationItem.title = currentUser?.name
        
    }
    
    private func loadData(){
        TriviaWrapper.fetchTriviaData{ (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let triviaData):
                DispatchQueue.main.async{
                    return self.trivia = triviaData
                }
            }
        }
    }
    
    
}
//TODO: -- add function to get data





