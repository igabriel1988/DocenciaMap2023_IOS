//
//  LoginViewController.swift
//  AppDocencia23
//
//  Created by Ivan Gabriel on 08/04/23.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    
    @IBOutlet weak var inputUsuario: UITextField!
    
    @IBOutlet weak var inputClave: UITextField!
    
    
    
    @IBOutlet weak var btnLogin: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    

    @IBAction func btnLoguear(_ sender: UIButton) {
    
        
        
        let usuario = inputUsuario.text
        let clave = inputClave.text
        
        if usuario == clave {
            
            
        }else{
            let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"),
                                          style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            tabBarController?.present(alert, animated: true, completion: nil)
        }
    }
}
