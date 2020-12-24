//
//  NotesListTableViewController.swift
//  NotesApp
//
//  Created by Page Kallop on 12/23/20.
//

import UIKit
import RealmSwift

class NotesListTableViewController: UITableViewController {

    //initializes realm 
    let realm = try! Realm()
    
    var noteTitles: Results<NoteData>?
    
    @IBOutlet weak var noteTableView: UITableView!
    
    @IBOutlet weak var addButtonPressed: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTableView.dataSource = self 
        noteTableView.delegate = self 
    }

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        if let listTitle = noteTitles?[indexPath.row] {
            cell.textLabel?.text = listTitle.title
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return noteTitles?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        performSegue(withIdentifier: "ToNotes", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! NotesViewController
        
    }



}
