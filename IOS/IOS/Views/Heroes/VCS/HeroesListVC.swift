//
//  HeroesListVC.swift
//  IOS
//
//  Created by Josep Romera Andreu on 8/3/24.
//

import Foundation
import UIKit


class HeroesListVC: VC{
    
    @IBOutlet weak var table: UITableView!
    var callInProgress = false
    var heroes: [Hero] = []
    var totalOfHeroes: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        getMoreHeroes()
    }
    
    func getMoreHeroes(){

        if(self.callInProgress){
            return
        }

         var currentLimit = 20
            if let totalOfHeroes = totalOfHeroes {
                let pendentHeroes = totalOfHeroes - heroes.count
                
                if(pendentHeroes <= 0){
                    return
                }
                
                if(pendentHeroes < currentLimit){
                    currentLimit = pendentHeroes
                }
            }
        
        RepoManager.Marvel.getHeroes(offset: self.heroes.count, limit: 20){
            heroes,total in
            self.heroes.insert(contentsOf: heroes, at: self.heroes.count)
            self.table.reloadData()
            
        }
    }
}
extension HeroesListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = indexPath.row % 2 == 0 ? "HeroCellLeft" : "HeroCellRight"
        guard let heroCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? HeroCell else {
            return Cell()
        }
        heroCell.setupWith(hero: heroes[indexPath.row])
        
        if(heroes.count - indexPath.row <= 5){
            getMoreHeroes()
        }
        
        return heroCell
    }
    
    
}
    //"https://digi-api.com/api/v1/digimon/289"

   
