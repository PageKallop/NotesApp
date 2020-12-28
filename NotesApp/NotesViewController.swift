//
//  NotesViewController.swift
//  NotesApp
//
//  Created by Page Kallop on 12/23/20.
//

import UIKit
import RealmSwift

class NotesViewController: UIViewController, UITextViewDelegate {
    
    //initializes realm 
    var realm = try! Realm()
    var notes: Results<NoteData>?
    var noteTitle: NoteData?
    
   
   
    
    

    @IBOutlet weak var noteTitleLabel: UITextField! {
        didSet {
            //sets color for the placeholder text in note text field
            let whitePlaceholderText = NSAttributedString(string: "Note Title",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            noteTitleLabel.attributedPlaceholder = whitePlaceholderText
        }
    }
    
    @IBOutlet weak var noteTextField: UITextView!
    
    @IBOutlet weak var saveButtonPressed: UIBarButtonItem!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // loads saved notes into ui
        noteTitleLabel.text = noteTitle?.title
        noteTextField.text = noteTitle?.content
        
       
        //changes color of navbar
        navigationController?.navigationBar.barTintColor = UIColor.clear
        
      }
    

    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        
        let newNote = NoteData()
       
        //gets currrent inputs and save them
        newNote.title = noteTitleLabel.text ?? ""
        newNote.content = noteTextField.text ?? ""
        
        self.saveNotes(newNote: newNote)
       
        //returns to root view controller
        self.navigationController?.popViewController(animated: true)
        
       
    }
    
    //saves new notes to realm
    func saveNotes(newNote: NoteData) {
       
        do {
        try realm.write{
            realm.add(newNote, update: .all)
        }
        } catch {
            
            print("error saving added note")
        }
        
    }
    
    
    @IBAction func deleteButtonPressed(_ sender: UIBarButtonItem) {
        
       deleteNote()
        self.navigationController?.popViewController(animated: true)
    }
    // removes objects from realm
    func deleteNote(){
        
            try! realm.write{
                realm.delete(noteTitle!)
           
        }
        
    }
    
   
}
