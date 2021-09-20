//
//  Books.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 24/8/21.
//

import Foundation

struct Books: Codable {
  let count: Int
  let all: [Book]
  
  enum CodingKeys: String, CodingKey {
    case count
    case all = "results"
  }
}
