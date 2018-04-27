//
//  CardsViewController.swift
//  tinder-codepath
//
//  Created by Christopher Guan on 4/16/18.
//  Copyright © 2018 Christopher Guan. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanCard(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
            cardInitialCenter = cardImageView.center
        } else if sender.state == .changed {
            print("Gesture is changing")
            cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y:cardInitialCenter.y)
        } else if sender.state == .ended {
            print("Gesture ended")
        }
    }

    
}
