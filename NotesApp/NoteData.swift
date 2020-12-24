//
//  NoteData.swift
//  NotesApp
//
//  Created by Page Kallop on 12/24/20.
//

import Foundation
import RealmSwift

class NoteData: Object {
   @objc dynamic var title : String = ""
   @objc dynamic var content : String = ""
   @objc dynamic var lastEdited : Date = Date()
   @objc dynamic var noteId: String = ""
    
    
}
