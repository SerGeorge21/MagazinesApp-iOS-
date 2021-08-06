//
//  KeychainStore.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 2/8/21.
//

import Foundation
import Security
import KeychainAccess

class KeychainStore{
    
    let exampleToken = "IreallyHopeThisWor"
    
    func storeToKeychain(){
        let keychainItemQuery = [
            kSecValueData: exampleToken.data(using: .utf8)!,
            kSecAttrApplicationTag: "access_token",
            kSecAttrServer: "threenitas.com",
            kSecClass: kSecClassGenericPassword
        ] as CFDictionary
        
        let status = SecItemAdd(keychainItemQuery, nil)
        print("!!!!Operation finished with status: \(status)")
    }
    
    func retrieveFromKeychain() -> String {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrServer: "threenitas.com",
            kSecAttrApplicationTag: "access_token",
            kSecReturnData: true,
            kSecReturnAttributes: true,
            //kSecMatchLimit: 1
        ] as CFDictionary
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query, &result)
        
        print("!!!!Operation finished with status \(status)")
        
        let dic = result as! NSDictionary
        let accessTokenData = dic[kSecValueData] as! Data
        let accessToken = String(data: accessTokenData, encoding: .utf8)!
        
        print("---ACCESS TOKEN RETRIEVED IS : \(accessToken)")
        
        return accessToken
    }
}
