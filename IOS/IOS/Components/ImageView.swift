//
//  ImageView.swift
//  IOS
//
//  Created by Josep Romera Andreu on 22/3/24.
//

import Foundation
import UIKit

class ImageV: UIImageView {
    private static let NonSecureDelegate = NonSecureCallDelegate()
    private static let ImageSession : URLSession = {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .returnCacheDataElseLoad
        
        let session = URLSession(configuration: config, delegate: NonSecureDelegate,delegateQueue: OperationQueue.current)
        return session
    }()
    
    private var currentTask: URLSessionTask? = nil
    
    func SetImageAsync(url: URL){
        currentTask?.cancel()
        currentTask = ImageV.ImageSession.dataTask(with: URL,completionHandler: { imageData, response, error in
            if let imageData = imageData {
                if let image = UIImage(data: imageData){
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        })
        currentTask?.resume()
    }
    private class NonSecureCallDelegate: NSObject, URLSessionDelegate {
        public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
            
            if let serverTrust = challenge.protectionSpace.serverTrust{
                completionHandler(.useCredential, URLCredential(trust: serverTrust))
            }
            
        }
    }
}
