//
//  MarvelRepository.swift
//  IOS
//
//  Created by Josep Romera Andreu on 15/3/24.
//

import Foundation

protocol MarvelRepository{
    typealias HeroesResponse = ([Hero],Int) -> ()
    func getHeroes(offset:Int,limit:Int,onSucces: @escaping HeroesResponse)
}
