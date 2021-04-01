//
//  FeedViewController.swift
//  TikTokVideo
//
//  Created by Depak on 01/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import UIKit
import AVKit
import AVFoundation

class FeedViewController: AVPlayerViewController, StoryboardScene {
    
    static var sceneStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var index: Int!
    fileprivate var feed: Feed!
    fileprivate var isPlaying: Bool!
    
    static func instantiate(feed: Feed, andIndex index: Int, isPlaying: Bool = false) -> UIViewController {
        let viewController = FeedViewController.instantiate()
        viewController.feed = feed
        viewController.index = index
        viewController.isPlaying = isPlaying

        return viewController
    }
    
    @IBOutlet weak var playerView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerView.frame =  self.view.frame
        self.view.addSubview(self.playerView)
        initializeFeed()
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
         player?.pause()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        player?.play()
    }
    
    
    func play() {
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
    
    
    fileprivate func initializeFeed() {
        let url = feed.url
        player = AVPlayer(url: url)
        isPlaying ? play() : nil
    }
}


