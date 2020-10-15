//
//  LoginViewController.swift
//  Twitter
//
//  Created by Pawan on 10/5/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) { // This function normally ask what should i do i have loaded up
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
            self.performSegue(withIdentifier: "loginToHome", sender: self) // when true will; just send the user to his/her page
        }
    }
    
    
    @IBAction func LoginButton(_ sender: Any) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            self.performSegue(withIdentifier: "loginToHome", sender: self) // This code show where to go
            UserDefaults.standard.set(true, forKey: "userLoggedIn") // this code make sure that there is a note that app can check to if they have already logged in or not
            
        }, failure: { (Error) in
            print("Could not Login")
        })
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
