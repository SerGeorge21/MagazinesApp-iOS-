//
//  Book.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 24/8/21.
//

import Foundation

struct Book : Codable{
    
    var id : Int
    var title : String
    var img_url : String
    var date_released : String
    var pdf_url : String
    
    
    enum CodingKeys : String, CodingKey {
        case id = "id"
        case title = "title"
        case img_url = "img_url"
        case date_released = "date_released"
        case pdf_url = "pdf_url"
    }
}

