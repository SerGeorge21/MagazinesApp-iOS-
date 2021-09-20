//
//  HeaderCollectionReusableView.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 14/9/21.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var label: UILabel!
    
    static let identifier = "sectionHeader"
    
    public func setup(year: String){
        label.text = year
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 22.0)
    }
}
