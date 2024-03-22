//
//  HeroCell.swift
//  IOS
//
//  Created by Josep Romera Andreu on 22/3/24.
//

import Foundation
import UIKit

class HeroCell: Cell{
    @IBOutlet weak var heroImage: UIImageView!
    
    @IBOutlet weak var heroDescription: UITextView!
    @IBOutlet weak var heroName: UILabel!
    public func setupWith(hero: Hero){
        
        //if(let )
        heroName.text = hero.name
        heroDescription.text = hero.description
        
    }
    
}
