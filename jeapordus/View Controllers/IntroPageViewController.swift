//
//  IntroPageViewController.swift
//  jeapordus
//
//  Created by God on 9/16/19.
//  Copyright © 2019 Jeapordus Team. All rights reserved.
//

import UIKit

class IntroPageViewController: UIViewController {
    var userIntial: User?
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var startGameButton: UIButton!
    
    @IBAction func pressedStart(_ sender: UIButton) {
//        userIntial?.name = nameField.text
//        userIntial?.highScore = 0
//        userIntial?.lives =
        userIntial = User(name: nameField.text, lives: 5, highScore: 0)
     
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let segueIdentifier = segue.identifier else {fatalError()}
        switch segueIdentifier {
        case "startGame":
            guard let destinationVC = segue.destination as? JepViewController else {fatalError("unexpected segueVC")}
//            userIntial?.name = nameField.textm
            destinationVC.currentUser = userIntial
            destinationVC.navigationItem.title = userIntial?.name
        default:
            print(fatalError("Not Workiong"))
        }
    }
//
    
    

}

