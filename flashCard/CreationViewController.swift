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
    
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true);
    }
    @IBAction func didTapOnDone(_ sender: Any) {
       
        let questionText = questionTextField.text
        let answerText = questionTextField.text
        flashcardsController.updateFlashCard(question: questionText!, answer: answerText!)
        dismiss(animated: true);
        
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

