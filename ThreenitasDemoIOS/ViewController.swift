//
//  ViewController.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 20/7/21.
//

import UIKit
import KeychainAccess

class ViewController: UIViewController {
    
    @IBOutlet weak var logInButton: UIButton!
    
    /*@IBAction func logInClicked(_ sender: UIButton) {
        segueToBooks();
    }*/
    
    @IBOutlet weak var languageSelectorView: UIView!
    @IBOutlet weak var languagesView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var dropdownButton: UIButton!
    @IBAction func showAvailableLanguages(_ sender: Any) {
        if languagesView.isHidden {
            languagesView.isHidden = false
            languagesView.isUserInteractionEnabled = true
            //dropdownButton.setBackgroundImage(UIImage(named: "chevron.compact.up"), for: UIControl.State.normal)
        }else{
            languagesView.isHidden = true
            languagesView.isUserInteractionEnabled = false
            //dropdownButton.setBackgroundImage(UIImage(named: "chevron.compact.down"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func logInClicked(_ sender: UIButton) {
        segueToBooks()
    }
    
    func segueToBooks()-> Void{
        //logInButton.backgroundColor = UIColor.black
        
        guard let booklist_vc = storyboard?.instantiateViewController(identifier: "tabBar_vc") as? myTabBarController else{
            return //like saying: "can you try to instantiate this as this? If not then dont do anything"
        }
        
        NetworkingUtils().fetchAccessToken { [weak self](tokenResponse) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                let keychain : Keychain = Keychain(service: "threenitas.com")
                keychain["access_token"] = tokenResponse.accessToken
                //Navigation controller dimiourgei stoiva me controllers
                //present(booklist_vc, animated: true, completion: nil)
                //self.navigationController?.pushViewController(booklist_vc, animated: true)
            }
        }
        
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let tabViewController = segue.destination as? myTabBarController{
            tabViewController.modalPresentationStyle = .fullScreen
        }
    }*/
    
    
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
        
        languageSelectorView.layer.cornerRadius = 22
        //languageSelectorView.frame.size.height = 42
        languagesView.layer.cornerRadius = 22
        languagesView.isHidden = true
        
        self.navigationItem.title = "Log In"
    }


}

