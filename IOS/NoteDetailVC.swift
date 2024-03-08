//
//  NoteDetailVC.swift
//  IOS
//
//  Created by Josep Romera Andreu on 1/3/24.
//

import Foundation
import UIKit

class NoteDetailVC: UIViewController{
    typealias OnSave = (String, String) -> ()
    typealias OnCancel = () -> ()
    
    var onSave: OnSave?
    var onCancel: OnCancel?
    
    @IBOutlet weak var contentField: UITextView!
    
    @IBOutlet weak var titleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.onCancel?()
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let title: String = titleField.text ?? ""
        let content: String = contentField.text ?? ""
        
        self.onSave?(title,content)
    }
}
