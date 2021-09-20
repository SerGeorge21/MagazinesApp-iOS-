//
//  TriangleView.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 10/9/21.
//

import UIKit

class TriangleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        
        self.backgroundColor = .clear
    }
    
    func createTriangle(){
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: self.bounds.width, y: 0.0))
        
        //line between starting point and bottom side
        path.addLine(to: CGPoint(x:0.0, y:self.frame.size.height))
        path.addLine(to: CGPoint(x:self.frame.size.height, y:self.frame.size.height))
        path.close()
        //path.addLine(to: CGPoint(x:self.frame.size.width, y:0.0))
        //path.addLine(to: CGPoint(x:self.frame.size.width, y:self.frame.size.height))
        
    }
    
    override func draw(_ rect: CGRect) {
        self.createTriangle()
        
        UIColor(red: 80.0/255.0, green: 162.0/255.0, blue: 53.0/255.0, alpha: 1).setFill()
        //UIColor.green.setStroke()
        path.fill()
        //path.stroke()
    }

}
