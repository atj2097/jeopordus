//
//  IntroPageViewController.swift
//  jeapordus
//
//  Created by God on 9/16/19.
//  Copyright © 2019 Jeapordus Team. All rights reserved.
//

import UIKit

class IntroPageViewController: UIViewController {

    var userInitial: User?

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var startGameButton: UIButton!
    
    @IBOutlet weak var jeopordyText: UILabel!
    @IBAction func pressedStart(_ sender: UIButton) {

     
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startGameButton.backgroundColor = .clear
        startGameButton.layer.cornerRadius = 5
        startGameButton.layer.borderWidth = 3
        startGameButton.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 50)
        nameField.font = UIFont(name: "MarkerFelt-Wide", size: 20)
        startGameButton.layer.borderColor = UIColor.white.cgColor
        jeopordyText.font = UIFont(name: "MarkerFelt-Wide", size: 70)
        
        MusicPlayer.shared.startBackgroundMusic()
       
    }
   
   

    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {fatalError()}
        switch segueIdentifier {
        case "startGame":
            guard let destinationVC = segue.destination as? JepViewController else {fatalError("unexpected segueVC")}
            userInitial = User(name: nameField.text, lives: 5, Score: 0)
            destinationVC.currentUser = userInitial
            let backItem = UIBarButtonItem()
            backItem.title = "Quit"
            navigationItem.backBarButtonItem = backItem
        default:
            print(fatalError("Not Working"))
        }
    }
}


