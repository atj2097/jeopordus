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
//        url = "https://opentdb.com/api.php?amount=10&category=\(id)&difficulty=easy&type=multiple"
//        loadData()
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
            }
            self.videoView.layer.addSublayer(playerLayer)
            avPlayer?.play()
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
//TODO: -- add function to get data

    
    




