//
//  NotesListVC.swift
//  IOS
//
//  Created by Josep Romera Andreu on 1/3/24.
//

import Foundation
import UIKit

class NotesListVC: UIViewController,UITableViewDataSource{
    
    @IBOutlet weak var table: UITableView!
    
    enum DetailMode{
        case create
        case update
    }
    
    @IBOutlet weak var acceptBt: UIButton!
    
    var onSave: OnSave?
    var onCancel: OnCancel?
    
    var mode:DetailMode = .create
    var notesList: [Note] = []
    
    var noteDetailVC: NoteDetailVC?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        table.dataSource = self
        
        let defaults = UserDefaults.standard

        if let notes = defaults.read([Note].self, key: "NotesSaved"){
            notesList = notes
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let noteDetailVC = storyboard.instantiateViewController(withIdentifier: "NoteDetailVC" as? NoteDetailVC){
            
            self.present(noteDetailVC, animated: true)
            noteDetailVC.onCancel = {
                noteDetailVC.dismiss(animated: true)
            }
            noteDetailVC.onSave = { title, content in
                
                
            }
            }
            addNote()
        
        table.reloadData()
        
        let defaults = UserDefaults.standard
        defaults.save(data: notesList, key: "NotesSaved")
        defaults.synchronize()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return notesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"NoteCell", for: indexPath) as? NoteCell else{
            return UITableViewCell()
        }
        let note = notesList[indexPath.row]
        cell.title.text = note.title
        cell.content.text = note.content
        
        cell.onClick = {
            noteDetailVC.setMode(mode: .update)
            noteDetailVC.
        }
        
        return cell
    }
    
    @IBAction func addNoteBtPress(_ sender: Any) {
        if let noteDetailVC = self.noteDetailVC{
            noteDetailVC.clear()
            self.present(self.noteDetailVC, animated: true)
        }
        
        
    }
    

    
    

    func addNote(title: String, content: String){
        notesList.append(
            Note(title: "Note Title", content: <#T##String#>))
    }
            
            func clear(){
                titleField.text = ""
                contentField.text = ""
            }
            
            func prepare(title: String, content: String){
                titleField.text = title
                contentField.text = content
            }
            
    func setMode(mode: DetailMode){
        self.mode = mode
        switch(mode){
        case .create:
            acceptBt.setTitle(<#T##title: String?##String?#>, for: <#T##UIControl.State#>)
        }
    case .update{
        
    }
    }
    
    func saveNotesList(){
        
    }
}
    


