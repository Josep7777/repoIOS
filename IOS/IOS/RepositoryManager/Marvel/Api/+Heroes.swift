//
//  +Hero.swift
//  IOS
//
//  Created by Josep Romera Andreu on 15/3/24.
//

import Foundation

extension MarvelApiRepository{
    func getHeroes(offset: Int = 0,limit: Int 20, onSucces: @escaping MarvelRepository.HeroesResponse) {
        let marvelComponents = MarvelURLComponents()
        
        marvelComponents:
        .addToPath(.Characters)
        .addOffset(offset)
        .addLimit(limit)
        
        if let url = marvelComponents.Components?.url{
            URLSession.getData(url: url){ response in
                let r: HeroesResponse = response
                onSucces(result.data.results)
            }onFailure: { error in
                
            }
        }

    }
}
