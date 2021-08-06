//
//  BookListViewController.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 22/7/21.
//

import UIKit
import KeychainAccess

class BookListViewController: UIViewController {

    
    //@IBOutlet weak var receivedText: UILabel!
    var myText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //receivedText.text = "Hi there friends"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        let keychain = Keychain(service: "threenitas.com")
        //receivedText.text = keychain["access_token"]
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
