//
//  ViewController.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 20/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBAction func logInClicked(_ sender: UIButton) {
        segueToBooks();
    }
    
    func segueToBooks()-> Void{
        //logInButton.backgroundColor = UIColor.black
        
        guard let booklist_vc = storyboard?.instantiateViewController(identifier: "booklist_vc") as? BookListViewController else{
            return //like saying: "can you try to instantiate this as this? If not then dont do anything"
        }
        //booklist_vc.myText =
        //let booklist_vc = BookListViewController(textToshow: "Hi there little friend")
        //Navigation controller dimiourgei stoiva me controllers
        //present(booklist_vc, animated: true, completion: nil)
        navigationController?.pushViewController(booklist_vc, animated: true)
    }
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logInButton.layer.cornerRadius = 22
        
        let whiteUserPlaceholderText = NSAttributedString(string: "Username",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        let whitePassPlaceholderText = NSAttributedString(string: "Password",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
                
        usernameTextField.attributedPlaceholder = whiteUserPlaceholderText
        passwordTextField.attributedPlaceholder = whitePassPlaceholderText
    }


}

