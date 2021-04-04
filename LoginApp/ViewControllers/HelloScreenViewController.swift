//
//  HelloScreenViewController.swift
//  LoginApp
//
//  Created by Alex on 31.03.2021.
//

import UIKit

class HelloScreenViewController: UIViewController {

    @IBOutlet weak var welcomeText: UILabel!
    
    var welcomeTextAgent: String! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeText.text = "Welcome, " + welcomeTextAgent + "!" // 
    }

}
