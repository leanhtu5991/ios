//
//  ViewController.swift
//  ios
//
//  Created by estiam on 17/07/2019.
//  Copyright © 2019 estiam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var btn_login: UIButton!
    

    @IBOutlet weak var _login_button: UIButton!
    @IBOutlet weak var _password: UITextField!
    @IBOutlet weak var _email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func LoginButton(_ sender: Any) {
        print("here")
        let email = _email.text
        let password = _password.text
        if(email==""||password==""){
            return
        }
        print(email)
        print(password)
        DoLogin(_e:email!, _p:password!)
    }

    
    func DoLogin(_e: String, _p: String){
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
        
        let parameters: [String: Any] = ["email": _e, "password": _p]
       
        //create the url with URL
        let url = URL(string: "http://172.16.9.42:3000/api/login")! //change the url
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            print(request.httpBody)
        } catch let error {
            print(error.localizedDescription)
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(data)
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                }
            }
        }
        task.resume()
    }
    
}

