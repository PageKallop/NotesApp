//
//  NotesViewController.swift
//  NotesApp
//
//  Created by Page Kallop on 12/23/20.
//

import UIKit
import RealmSwift

class NotesViewController: UIViewController {
    
    //initializes realm 
    var realm = try! Realm()
    var notes: Results<NoteData>?
    var noteTitle: NoteData?
    var noteContent: NoteData?
    
    

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
   notes = retrieveNotes()
        noteTitleLabel.text = noteTitle?.title
        noteTextField.text = noteContent?.content
        
        print(noteContent?.content)
        //changes color of navbar
        navigationController?.navigationBar.barTintColor = UIColor.clear
        


    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        
        let newNote = NoteData()
        //gets currrent inputs and save them
        newNote.title = noteTitleLabel.text ?? ""
        newNote.content = noteTextField.text ?? ""
        
        self.saveNotes(addedNote: newNote)
        //returns to root view controller
        navigationController?.popViewController(animated: true)
        print("saved")
    }
    
    //saves new notes to realm
    func saveNotes(addedNote: NoteData) {
       
        do {
        try realm.write{
            realm.add(addedNote)
        }
        } catch {
            
            print("error saving added note")
        }
        
    }
    func retrieveNotes() -> Results<NoteData> {
        return realm.objects(NoteData.self)
    }

}
