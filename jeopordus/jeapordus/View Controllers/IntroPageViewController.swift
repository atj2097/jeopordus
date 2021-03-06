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
//    var userIntial: User?

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var startGameButton: UIButton!
    
    @IBOutlet weak var jeopordyText: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        startGameButton.backgroundColor = .clear
        startGameButton.layer.cornerRadius = 5
        startGameButton.layer.borderWidth = 3
        startGameButton.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 50)
        nameField.font = UIFont(name: "MarkerFelt-Wide", size: 20)
        startGameButton.layer.borderColor = UIColor.white.cgColor
        jeopordyText.font = UIFont(name: "MarkerFelt-Wide", size: 70)
        
//        MusicPlayer.shared.startBackgroundMusic()
        // Do any additional setup after loading the view.
    }
   
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {fatalError()}
        switch segueIdentifier {
        case "startGame":
            guard let destinationVC = segue.destination as? JepViewController else {fatalError("unexpected segueVC")}
            guard let name = nameField.text else {return}
           
            userInitial = User(name: name, lives: 5, highScore: 0)
            destinationVC.currentUser = userInitial
            let backItem = UIBarButtonItem()
            backItem.title = "Quit"
            navigationItem.backBarButtonItem = backItem
            
        default:
            print(fatalError("Not Working"))
        }
    }
}
 

