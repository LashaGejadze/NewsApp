//
//  LoginVC.swift
//  NewsApp
//
//  Created by macosx on 22.07.17.
//  Copyright © 2017 macosx. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import SDWebImage

class LoginVC: UIViewController {
    @IBOutlet fileprivate weak var holder: UIView!
    @IBOutlet fileprivate weak var avatar: UIImageView!
    @IBOutlet fileprivate weak var name: UILabel!
    @IBOutlet fileprivate weak var loginBtn: FBSDKLoginButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.readPermissions = ["public_profile", "email", "user_friends", "user_photos"]
        configUI()
        getUserInformation()
        // Do any additional setup after loading the view.
    
    }
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "qqRegistrationpp") as! RegistrationVC; self.navigationController?.pushViewController(signUpVC, animated: true)
    }

    // MARK: - Create Avatar As Circle
    fileprivate func configUI () {
        // fix scale
        avatar.contentMode = .scaleAspectFill
        avatar.clipsToBounds = true
        
        // set circle
        avatar.layer.cornerRadius = avatar.frame.size.width/2
        avatar.layer.masksToBounds = true
        
        // set borders
        avatar.layer.borderColor = UIColor.blue.cgColor
        avatar.layer.borderWidth = 0.8
    }
    // MARK: - Determine User Status
    private func userIsLoggedIn () -> Bool {
        return FBSDKAccessToken.current() != nil
    }
    
    // MARK: - Download Informatio
    fileprivate func getUserInformation () {
        if userIsLoggedIn() {
            let params = ["fields":"id,name,picture.type(large),email"]
            
            FBSDKGraphRequest(graphPath: "me", parameters: params).start(completionHandler: { [weak self] (connection, result, error) -> Void in
                if error == nil && result != nil {
                    self?.generateUserObjectUsingGraphResponse(with: result!)
                }
            })
        } else {
            print("Not Logged In!")
        }
    }
    
    // MARK: - Construct User Object
    private func generateUserObjectUsingGraphResponse (with result: Any) {
        let object = User()
        if let rep = result as? [String: Any] {
            object.name = rep["name"] as! String
            object.avatar = self.getUserAvatarUrl(with: rep["picture"] as! [String: Any])
            
            self.userInterfaceConfiguration(with: object)
        }
    }
    
    // MARK: - Assign Information
    fileprivate func userInterfaceConfiguration (with object: User) {
        holder.isHidden = false
        name.text = object.name
        avatar.sd_setImage(with: object.avatar)
    }
    
    // MARK: - Parse Profile Picture
    private func getUserAvatarUrl (with value: [String: Any]) -> URL? {
        if let value1 = value["data"] as? [String: Any] {
            if let value2 = value1["url"] as? String {
                return URL(string: value2)
            }
        }
        return nil
    }
}

// MARK: - FBSDKLoginButtonDelegatec
extension LoginVC : FBSDKLoginButtonDelegate {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error == nil {
            getUserInformation()
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "qqTabBarpp") as! TabBarControllerVC; self.navigationController?.pushViewController(vc, animated: true)
            
        } else {
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        holder.isHidden = true
        print("User Logged Out!")
    }


}
