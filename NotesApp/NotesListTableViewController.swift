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
        //changed tableview color
        noteTableView.backgroundColor = UIColor.gray
        //removed lines from empty cells
        noteTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        //changed line separator color to white 
        noteTableView.separatorColor = UIColor.white
        
        noteTableView.dataSource = self 
        noteTableView.delegate = self
      

        loadTitles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        noteTableView.reloadData()
        loadTitles()
    }
 
    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        if let listTitle = noteTitles?[indexPath.row] {
            cell.textLabel?.text = listTitle.title
            //changes cell color to clear
            cell.backgroundColor = UIColor.clear
            //changes font size 
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return noteTitles?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! NotesViewController
        
        if segue.identifier == "ToNotes" {
            destinationVC.noteTitle = noteTitles![noteTableView.indexPathForSelectedRow!.row]
        }
        
    }
    
    
    //load realm data
    func loadTitles() {
        noteTitles = realm.objects(NoteData.self)
        noteTitles = noteTitles?.sorted(byKeyPath: "lastEdited", ascending: false)
        noteTableView.reloadData()
    }
    


}
