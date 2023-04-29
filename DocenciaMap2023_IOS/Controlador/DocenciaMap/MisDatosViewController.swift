//
//  MisDatosViewController.swift
//  DocenciaMap2023_IOS
//
//  Created by Ivan Gabriel on 29/04/23.
//

import UIKit

class MisDatosViewController: UIViewController {

    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenuBtn.target = revealViewController()
                sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)
    }
}
