//
//  ViewController.swift
//  flashCard
//
//  Created by mcis-cysecenter on 2/14/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    
    
    @IBOutlet weak var frontLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func didTapOnCard(_ sender: Any) {
        if(self.frontLabel.isHidden == false){
            self.frontLabel.isHidden = true
        }
        else{
            self.frontLabel.isHidden = false
        }
    }
}

