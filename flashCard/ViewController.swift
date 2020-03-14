//
//  ViewController.swift
//  flashCard
//
//  Created by mcis-cysecenter on 2/14/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit

struct Flashcard{
    var question: String
    var answer: String
    var ExtraAnswer1 : String
    var ExtraAnswer2 : String
}

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!

    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var Card: UIView!
    
    @IBOutlet weak var btnOption1: UIButton!
    
    @IBOutlet weak var btnOption2: UIButton!
    
    @IBOutlet weak var btnOption3: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    //Array to hold flashcards
    var flashcards = [Flashcard]()
    
    //current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //read saved flashcards
        readSavedFlashcards()
        
        //adding our initial flash card if needed
        if flashcards.count == 0 {
            updateFlashCard(question: "Lead is an element is which group?", answer: "Group 14", isExisting: true, ExtraAnswer1: "Group 4", ExtraAnswer2: "Group 8")
        }
         
        else{
            updateLabels()
            updateNextPrevButtons()
        }
       
//        updateFlashCard(question: "What is the first element in the periodic table", answer:"Hydrogen", isExisting: false, ExtraAnswer1: "Helium", ExtraAnswer2: "Oxygen")
//
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
        
        if(self.backLabel.isHidden == true){
            self.backLabel.isHidden = false
            self.frontLabel.isHidden = true
        }
        else{
            self.backLabel.isHidden = true
            self.frontLabel.isHidden = false
        }
    }
    
    @IBAction func didTapOnbtnOption1(_ sender: Any) {
        self.frontLabel.isHidden = false
    }
    
    
    @IBAction func didTapOnbtnOption2(_ sender: Any) {
        if(self.backLabel.isHidden == true){
            self.backLabel.isHidden = false
            self.frontLabel.isHidden = true
        }
        else{
            self.backLabel.isHidden = true
            self.frontLabel.isHidden = false
        }
        
    }
    
    
    @IBAction func didTapOnbtnOption3(_ sender: Any) {
        self.frontLabel.isHidden = false
    }
    
    
   
    @IBAction func didTapOnPrev(_ sender: Any) {
       //decrease  current index
        currentIndex = currentIndex - 1
        
        //update labels
        updateLabels()
        
        //update buttons
        updateNextPrevButtons()
        
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        //increase current index
        currentIndex = currentIndex + 1
        
        //update labels
        updateLabels()
        
        //update buttons
        updateNextPrevButtons()
    }
    
    
    @IBAction func didTapOnDelete(_ sender: Any) {
        let alert = UIAlertController(title: "Delete flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) {action in self.deleteCurrentFlashcard()}
        alert.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel )
        
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    
    func deleteCurrentFlashcard(){
        //delete current
        flashcards.remove(at: currentIndex)
        
        //special case: check if the last card was deleted
        
        if currentIndex > flashcards.count - 1{
            currentIndex = flashcards.count - 1
        }
        
        //update preve and next button
        updateNextPrevButtons()
    
        //update labels
        updateLabels()
        
        //store the update array of flashCard to disk
        saveAllFlashcardsToDisk()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
        if(segue.identifier == "EditSegue"){
        creationController.initialQuestion = frontLabel.text
        creationController.initialAnswer = backLabel.text
        }
    }
    
    
    func updateFlashCard(question:String, answer: String, isExisting: Bool, ExtraAnswer1: String, ExtraAnswer2: String){
        
       
        
        let flashcard = Flashcard(question: question, answer: answer, ExtraAnswer1: ExtraAnswer1, ExtraAnswer2: ExtraAnswer2)
        //adding flashcard in the flashcards array
        
        if isExisting{
            //replace existing flashcard
            flashcards[currentIndex] = flashcard
        }
        else{
            //adding flashcard in the flashcards array
            flashcards.append(flashcard)
            print(";) Added new flashcard")
            print("we now have \(flashcards.count) flashcards")
            //update current index
            currentIndex = flashcards.count - 1
            print("our current index is \(currentIndex)")
        }
        //update buttons
        updateNextPrevButtons()
        
        //update labels
        updateLabels()
        
        saveAllFlashcardsToDisk()
        
      
        btnOption1.setTitle(ExtraAnswer1, for: .normal)
        btnOption2.setTitle(answer, for: .normal)
        btnOption3.setTitle(ExtraAnswer2, for: .normal)
        
        
    }
    
    func updateLabels(){
    
        //get current flashcard
        let  currentFlashcard = flashcards[currentIndex]
        
        backLabel.text = currentFlashcard.answer
        frontLabel.text = currentFlashcard.question
    }
    func updateNextPrevButtons(){
               //disable next button if at the end
               if currentIndex == flashcards.count - 1{
                   nextButton.isEnabled = false
               }else{
                   nextButton.isEnabled = true
               }
               
               //disable prev button if at the begininning
           }
    
    func saveAllFlashcardsToDisk(){
        
        //from flashcard array to dictionary array
        let dictionaryArray = flashcards.map { (card) -> [String:String] in
            return["question": card.question, "answer":card.answer, "ExtraAnswer1":card.ExtraAnswer1, "ExtraAnswer2": card.ExtraAnswer2]
        }
        
        // save array on disk using userDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
//            flashcards, forKey: "flashcards")
        print(" Flashcards saved to userDefaults")
    }
    
    func readSavedFlashcards(){
        //read dictionary array from disk(if any)
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            
            let savedCards = dictionaryArray.map{dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, ExtraAnswer1: dictionary["ExtraAnswer1"] ?? "", ExtraAnswer2: dictionary["ExtraAnswer2"] ?? "")
                
            }
            //put all these cards in our flashcards array
            flashcards.append(contentsOf: savedCards)
        }
    }
}



