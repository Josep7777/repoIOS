//
//  URLSesion+JSON.swift
//  IOS
//
//  Created by Josep Romera Andreu on 15/3/24.
//

import Foundation
extension URLSession{
    
    struct ApiCallError: Error {
        
        public enum ApiErrorType{
            
            case RequestError(Error)
            case CantReadJson
            case CantParseJson(String)
            
        }
        let apiErrorType: ApiErrorType
    }
    func getData<T:Decodable> (
        url: URL,
        onSuccess: @escaping (T) -> (),
        onFailure: @escaping() ->() ){
            let request = URLRequest(url: url)
            let task = shared.dataTask(with: request) { data, response, error 
                in
                
                if let error = error {
                    DispatchQueue.main.async {
                        onFailure(ApiCallError(apiErrorType: .CantReadJson))
                    }
                    return
                }
                guard let data = data, let jsonString = String(data: data, enconding: .utf8)else{
                    DispatchQueue.main.async{
                        onFailure(Error())
                    }
                    return
                }
                guard let parsedData = try? JSONDecoder().decode(T.self, from: data) else {
                    DispatchQueue.main.async{
                        onFailure(ApiCallError(apiErrorType: .CantReadJson(jsonString)))
                    }
                }
                
                DispatchQueue.main.async {
                    onSuccess(parsedData)
                }
                if let data = data, let jsonstring = String(data: data, enconding: .utf8){
                    
                }
            
            }
            task.resume()
    
    }
}
