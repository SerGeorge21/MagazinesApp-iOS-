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
    let books_url = "https://3nt-demo-backend.azurewebsites.net/Access/Books"
    
    let token = "T1amGT21.Idup.298885bf38e99053dca3434eb59c6aa"
    
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
    
    func fetchBookData(completion: @escaping ([Book])->Void) -> Void {
        //no parameters - only authorization with bearer token
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        
        
        /*THIS WORKS*/
         let request = AF.request(books_url, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: [Book].self){ (response) in
            print(response)
            guard let books = response.value else {return}
            //print(books.first!.title)
            for b in books{
                print(b.title)
            }
            completion(books)
        }
        
        /*WHY DOESNT THIS WORK
         let request = AF.request(books_url, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Books.self){ (response) in
            print(response)
            guard let books = response.value else {return}
            print(books.all[1].title)
        }*/
        
        /*THIS WORKS
         let request = AF.request(books_url, encoding: JSONEncoding.default, headers: headers).responseJSON { (result) in
            print(result)
        }*/
    }
    
    
}
