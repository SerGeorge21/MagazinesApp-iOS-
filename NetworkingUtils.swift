//
//  NetworkingUtils.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 2/8/21.
//

import Foundation
import KeychainAccess
import Alamofire

class NetworkingUtils {
    
    let username = "TH1234"
    let password = "3NItas1!"
    let base_url = "https://3nt-demo-backend.azurewebsites.net/Access/Login"

    
    func fetchAccessToken(completion: @escaping (TokenResponse)->Void) -> Void {
        let parameters : [String : Any] = [
            "username": "TH1234",
            "password":"3NItas1!"
        ]
        
        
        let request = AF.request(base_url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseDecodable(of: TokenResponse.self) { (response) in
                print(response)
                if let tokenResponse = response.value {
                    print("----ACCESS TOKEN ----" + tokenResponse.accessToken)
                    
                    completion(tokenResponse)
                   
                }
                
            }
        
    }
    
    
}
