//
//  NotesViewController.swift
//  NotesApp
//
//  Created by Page Kallop on 12/23/20.
//

import UIKit
import RealmSwift

class NotesViewController: UIViewController {
    
    
    var realm = try! Realm()

    @IBOutlet weak var noteTitleLabel: UITextField! {
        didSet {
            let whitePlaceholderText = NSAttributedString(string: "Note Title",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            noteTitleLabel.attributedPlaceholder = whitePlaceholderText
        }
    }
    
    @IBOutlet weak var noteTextField: UITextView!
    
    @IBOutlet weak var saveButtonPressed: UIBarButtonItem!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.clear
        


    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        
        let newNote = NoteData()
        
        newNote.title = noteTitleLabel.text ?? ""
        newNote.content = noteTextField.text ?? "" 
   
    }
    


}
