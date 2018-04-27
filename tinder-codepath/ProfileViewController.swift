//
//  ProfileViewController.swift
//  tinder-codepath
//
//  Created by Christopher Guan on 4/27/18.
//  Copyright © 2018 Christopher Guan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    var image: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = 10.0
        profileImageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
