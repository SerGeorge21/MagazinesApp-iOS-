//
//  PDFViewController.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 8/9/21.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {
    
    var pdfView = PDFView()
    var pdfURL: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(pdfView)

        if let document = PDFDocument(url: pdfURL){
            pdfView.document = document
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        pdfView.frame = self.view.frame
    }

}
