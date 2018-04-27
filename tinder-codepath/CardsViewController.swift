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
            var angle = 0.0
            if (translation.x > 0) {
                if (translation.x < 15) {
                    angle = Double(translation.x)
                } else {
                    angle = 15.0
                }
                cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(angle * Double.pi / 180))
                cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y:cardInitialCenter.y)
            } else {
                if (translation.x > -15) {
                    angle = Double(translation.x)
                } else {
                    angle = -15.0
                }
                cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(angle * Double.pi / 180))
                cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y:cardInitialCenter.y)
            }
        } else if sender.state == .ended {
            print("Gesture ended")
            
            if (translation.x > 100) {
                cardImageView.transform = CGAffineTransform(translationX: 500, y: 0)
            } else if (translation.x < -100) {
                cardImageView.transform = CGAffineTransform(translationX: -500, y: 0)
            } else {
                cardImageView.transform = CGAffineTransform.identity
            }

        }
    }

    
}
