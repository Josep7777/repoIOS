//
//  HeroesListVC.swift
//  IOS
//
//  Created by Josep Romera Andreu on 8/3/24.
//

import Foundation
import UIKit

struct Pokemon: Codable {
    let name: String
    let sprites: PokemonSprites
}

struct PokemonSprites: Codable{
    let back: String
    let front: String
    
    enum CodingKeys: String,CodingKey{
        case back = "back_default"
        case front = "front_default"
    }
}

class HeroesListVC: VC{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string:  "https://pokeapi.co/api/v2/pokemon/charizard"){
            
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let data = data, let jsonString = String(data: data, encoding: .utf8){
                    
                    if let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data){
                        DispatchQueue.main.async{
                            print(jsonString)
                        }
                    }

                }
            }
            task.resume()
        }
        
        
    //"https://digi-api.com/api/v1/digimon/289"

    }
}
