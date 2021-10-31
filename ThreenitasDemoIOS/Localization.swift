//
//  Localization.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 1/10/21.
//

import Foundation

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self
        )
        
    }
}
