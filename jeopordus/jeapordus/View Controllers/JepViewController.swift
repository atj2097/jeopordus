import UIKit

class JepViewController: UIViewController {
    @IBOutlet weak var topicOne: UILabel!
    @IBOutlet weak var topicTwo: UILabel!
    @IBOutlet weak var randomTopic: UILabel!
    var currentUser: User!
    var counter = 0
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
            "none"}
        print(id)
        sender.isHidden = true
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let jeopDVC = storyboard.instantiateViewController(withIdentifier: "JeopDVC") as! JeopDVC
        
        jeopDVC.buttonid = id
        jeopDVC.modeChoice = mode
        jeopDVC.currentUser = currentUser
        navigationController?.pushViewController(jeopDVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topicOne.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        topicTwo.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        randomTopic.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        self.navigationItem.title = currentUser.name
    
        
        for buttons in gameButtons {
            buttons.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 30)
            
            
        }
        
        
        
        
    }
}
