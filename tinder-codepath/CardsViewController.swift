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
        
        cardImageView.layer.cornerRadius = 10.0;
        
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
            if (translation.x > 0) {
                cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(20 * Double.pi / 180))
                cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y:cardInitialCenter.y)
            } else {
                cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(-20 * Double.pi / 180))
                cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y:cardInitialCenter.y)
            }
        } else if sender.state == .ended {
            print("Gesture ended")
            if (translation.x > 0) {
                cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(0))
            } else {
                cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(0))
            }

        }
    }

    
}
