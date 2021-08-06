//
//  BookCollectionViewController.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 4/8/21.
//

import UIKit
import KeychainAccess

class BookCollectionViewController: UIViewController {

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
        
    

}

extension BookCollectionViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath)
        return cell
    }
    
    
    
}
