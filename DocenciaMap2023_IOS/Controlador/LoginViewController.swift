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

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnLoguear(_ sender: UIButton) {
        
        let usuario = inputUsuario.text
        let clave = inputClave.text
        print("logueo",usuario!)
        print("clave",clave!)
    }
    
}
