//
//  RegistrationVC.swift
//  NewsApp
//
//  Created by macosx on 22.07.17.
//  Copyright © 2017 macosx. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repPassTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    func checkpassword(password: String, reppassword:String) -> Void {
        if password == reppassword {
            return goOnlogin()
            
        }else{
            return
        }
    }
    func goOnlogin(){
        navigationController?.popToRootViewController(animated: true)
    }
    


    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        
    _ = goOnlogin()
        
    }

}
        extension RegistrationVC : UITextFieldDelegate {
            
         
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
                if textField == self.repPassTextField{
                    self.repPassTextField.becomeFirstResponder()
                }
                if  textField == self.usernameTextField{
                    self.usernameTextField.becomeFirstResponder()
                }
                if textField == self.passwordTextField{
                    self.passwordTextField.resignFirstResponder()
                }
                
                return true
            }
       
       
    }




  

