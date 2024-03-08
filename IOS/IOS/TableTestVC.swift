//
//  TableTestVC.swift
//  IOS
//
//  Created by Josep Romera Andreu on 23/2/24.
//
import UIKit
import Foundation

class TableTestVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var numberList: [Int] = []
    @IBOutlet weak var TextTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextTableView.dataSource = self
        TextTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
    -> Int{
        return numberList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell{
        guard let cell: TextCell = tableView.dequeueReusableCell(withIdentifier: "TextCellID", for: indexPath) 
            as? TextCell else{
            return UITableViewCell()
        }
        
        cell.TextTitle.text = String(numberList[indexPath.row])
        return cell
    }
    
    @IBAction func AddBowsBtPressed(_ sender: Any) {
        numberList.append(numberList.count + 1)
        
        TextTableView.reloadData()
    }
}
