//
//  CreationViewController.swift
//  flashCard
//
//  Created by mcis-cysecenter on 2/29/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet weak var questionTextField: UITextField!
    
    
    
    @IBOutlet weak var answerTextField: UITextField!
    
    
    @IBOutlet weak var ExtraAnswer1: UITextField!
    
    
    @IBOutlet weak var ExtraAnswer2: UITextField!
    
    
    
    var initialQuestion: String?
    var initialAnswer: String?
    
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true);
    }
    @IBAction func didTapOnDone(_ sender: Any) {
       
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        
        let ExtraAnswer1Text = ExtraAnswer1.text
        
        let ExtraAnswer2Text  = ExtraAnswer2.text
        
        
        
        
        //check if empty
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty){
            let alert = UIAlertController(title: "Missing text", message: "You need an answer", preferredStyle:.alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            present(alert, animated: true)
            
            alert.addAction(okAction)
        }
        else{
        flashcardsController.updateFlashCard(question: questionText!, answer: answerText!, ExtraAnswer1: ExtraAnswer1Text!, ExtraAnswer2: ExtraAnswer2Text)
        dismiss(animated: true);
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

