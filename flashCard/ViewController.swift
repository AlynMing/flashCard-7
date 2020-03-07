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
    
    @IBOutlet weak var Card: UIView!
    
    @IBOutlet weak var btnOption1: UIButton!
    
    @IBOutlet weak var btnOption2: UIButton!
    
    @IBOutlet weak var btnOption3: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //rounded corners for the card holder
        Card.layer.cornerRadius = 20.0
        Card.clipsToBounds = true
        Card.layer.shadowRadius = 15.0
        Card.layer.shadowOpacity = 0.2
        
        //rounded corner for the front label
        frontLabel.layer.cornerRadius = 20.0
        frontLabel.clipsToBounds = true
        frontLabel.layer.shadowRadius = 15.0
        frontLabel.layer.shadowOpacity = 0.2
        
        //rounded corner for the back label
        backLabel.layer.cornerRadius = 20.0
        backLabel.clipsToBounds = true
        backLabel.layer.shadowRadius = 15.0
        backLabel.layer.shadowRadius = 0.2
        btnOption1.layer.borderWidth = 3.0
        btnOption1.layer.borderColor = #colorLiteral(red: 0.1749481857, green: 0.3859854341, blue: 0.2115238309, alpha: 1)
        
        btnOption1.layer.cornerRadius = 20.0
        btnOption1.clipsToBounds = true
        btnOption1.layer.shadowRadius = 15.0
        btnOption1.layer.shadowRadius = 0.2
        btnOption2.layer.borderWidth = 3.0
        btnOption2.layer.borderColor = #colorLiteral(red: 0.1749481857, green: 0.3859854341, blue: 0.2115238309, alpha: 1)
         
        btnOption2.layer.cornerRadius = 20.0
        btnOption2.clipsToBounds = true
        btnOption2.layer.shadowRadius = 15.0
        btnOption2.layer.shadowRadius = 0.2
        btnOption2.layer.borderWidth = 3.0
        btnOption2.layer.borderColor = #colorLiteral(red: 0.1749481857, green: 0.3859854341, blue: 0.2115238309, alpha: 1)
        
        btnOption3.layer.cornerRadius = 20.0
        btnOption3.clipsToBounds = true
        btnOption3.layer.shadowRadius = 15.0
        btnOption3.layer.shadowRadius = 0.2
        btnOption3.layer.borderWidth = 3.0
        btnOption3.layer.borderColor = #colorLiteral(red: 0.1749481857, green: 0.3859854341, blue: 0.2115238309, alpha: 1)
        
        backLabel.isHidden = true
        
    }

 
    @IBAction func didTapOnCard(_ sender: Any) {
        
        if(self.backLabel.isHidden == false){
            self.frontLabel.isHidden = true
        }
        else{
            self.backLabel.isHidden = false
        }
    }
    
    @IBAction func didTapOnbtnOption1(_ sender: Any) {
        self.frontLabel.isHidden = false
    }
    
    
    @IBAction func didTapOnbtnOption2(_ sender: Any) {
        if(self.frontLabel.isHidden == false){
            self.frontLabel.isHidden = true
        }
        else{
            self.frontLabel.isHidden = false
        }
    }
    
    
    @IBAction func didTapOnbtnOption3(_ sender: Any) {
        self.frontLabel.isHidden = false
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self

    }
    
    func updateFlashCard(question:String, answer: String){
        
        backLabel.text = answer
        frontLabel.text = question
        
    }
}


