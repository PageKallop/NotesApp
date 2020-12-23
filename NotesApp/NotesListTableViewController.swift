//
//  NotesListTableViewController.swift
//  NotesApp
//
//  Created by Page Kallop on 12/23/20.
//

import UIKit

class NotesListTableViewController: UITableViewController {

    
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
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }



}
