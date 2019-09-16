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
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
//        self.navigationItem.title = currentUser?.name
        
        
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

}
