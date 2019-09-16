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
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    @IBOutlet weak var videoView: UIView!
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
        musicPlayer.layer.borderColor = UIColor.white.cgColor
        
        playBackgoundVideo()
        
    }

    private func playBackgoundVideo() {
        if let filePath = Bundle.main.path(forResource: "video", ofType:"mp4") {
            let filePathUrl = NSURL.fileURL(withPath: filePath)
            avPlayer = AVPlayer(url: filePathUrl)
            let playerLayer = AVPlayerLayer(player: avPlayer)
            playerLayer.frame = self.videoView.bounds
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.avPlayer?.currentItem, queue: nil) { (_) in
                self.avPlayer?.seek(to: CMTime.zero)
                self.avPlayer?.play()

    
    
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
            self.videoView.layer.addSublayer(playerLayer)
            self.avPlayer?.play()
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


//TODO: -- add function to get data

}
    
}


}

