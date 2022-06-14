//
//  TraillerViewController.swift
//  TrailerFlix
//
//  Created by Yasmin on 14/06/22.
//

import UIKit
import AVKit

class TraillerViewController: UIViewController {
    
    @IBOutlet weak var ivTrailer: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var viTrailer: UIView!
    
    var trailer: Trailer!
    var player: AVPlayer!
    var playerController: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
        preparePlayer()
    }
    
    func prepareView() {
        lbTitle.text = trailer.title
        lbYear.text = "\(trailer.year)"
        var rating = "Ainda não avaliado"
        if trailer.rating > 0 {
            rating = ""
            for _ in 1...trailer.rating {
                rating += "⭐️"
            }
        }
        
        lbRating.text = rating
        ivTrailer.image = UIImage(named: "\(trailer.poster)-large")
    }
    
    func preparePlayer() {
        let url = URL(fileURLWithPath: trailer.url)
        player = AVPlayer(url: url)
        playerController = AVPlayerViewController()
        playerController.player = player
        playerController.showsPlaybackControls = true
        playerController.player?.play()
        playerController.view.frame = viTrailer.bounds
        viTrailer.addSubview(playerController.view)
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
