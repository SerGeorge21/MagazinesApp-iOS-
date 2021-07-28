//
//  BookListViewController.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 22/7/21.
//

import UIKit

class BookListViewController: UIViewController {

    
    @IBOutlet weak var receivedText: UILabel!
    var myText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //receivedText.text = "Hi there friends"
        receivedText.text = myText
    }
    
    init(textToshow: String) {
        myText = "Some random text"
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
