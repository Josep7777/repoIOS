//
//  UserDefaults+Codable.swift
//  IOS
//
//  Created by Josep Romera Andreu on 1/3/24.
//

import Foundation

extension UserDefaults{
    func save(data: Codable, key: String) -> Bool{
        
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(data){
            self.set(encoded, forKey: key)
            return true
        }
        return false
    }
    
    
    func read<T:Codable>(_ t: T.Type, key: String) -> T? {
        
        if let data: Data = self.object(forKey: key) as? Data{
            let decoder = JSONDecoder()
            if let dataObject = try? decoder.decode(T.self, from: data){
                return dataObject
            }
        }
        return nil
        
    }
}
