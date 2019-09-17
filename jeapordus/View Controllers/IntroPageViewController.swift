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
    
    @IBAction func pressedStart(_ sender: UIButton) {
     
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {fatalError()}
        switch segueIdentifier {
        case "startGame":
            guard let destinationVC = segue.destination as? JepViewController else {fatalError("unexpected segueVC")}
            userInitial = User(name: nameField.text, lives: 5, highScore: 0)
            destinationVC.currentUser = userInitial
        default:
            print(fatalError("Not Working"))
        }
    }
}

