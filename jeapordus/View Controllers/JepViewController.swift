import UIKit

class JepViewController: UIViewController {
    @IBOutlet weak var music: UILabel!
    @IBOutlet weak var compSci: UILabel!
    @IBOutlet weak var randomTopic: UILabel!
    var currentUser: User!
    var counter = 0
    var score = 0
    var amount = 0
    @IBOutlet var gameButtons: [UIButton]!
    var trivia: [Trivia]!
    var scoreIncrement = ""
    @IBAction func buttonFunction(_ sender: UIButton) {
        let id = sender.tag
        var mode = ""
        
        switch sender.titleLabel?.text {
        case "$200":
            mode = "easy"
            amount = 200
        case "$400":
            mode = "medium"
            amount = 400
        case "$600":
            mode = "hard"
            amount = 600
        default:
            "none"}
        print(id)
        sender.isHidden = true
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let jeopDVC = storyboard.instantiateViewController(withIdentifier: "JeopDVC") as! JeopDVC
        
        jeopDVC.buttonid = id
        jeopDVC.modeChoice = mode
        jeopDVC.delegate = self
        navigationController?.pushViewController(jeopDVC, animated: true)
    }
    func updateScore(sign: String){
        if sign == "+"{
            score += amount
        }else {
            score -= amount
            counter += 1
        }}
    override func viewDidLoad() {
        super.viewDidLoad()
        music.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        compSci.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        randomTopic.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        for buttons in gameButtons {
            buttons.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        updateScore(sign: scoreIncrement)
    }
}
extension JepViewController: passData{
    func UserData(data: String) {
        self.scoreIncrement = data
    }    
}
