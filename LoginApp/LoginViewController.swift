//
//  ViewController.swift
//  LoginApp
//
//  Created by Alex on 31.03.2021.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    private let userName = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let helloScreenVC = segue.destination as? HelloScreenViewController else { return }
        helloScreenVC.welcomeTextAgent = userName
    }
    
    @IBAction func logInAction() {
        if usernameField.text != userName || passwordField.text != password {
            showAlert(
                title: "Wrong !",
                andMessage: "Your Username or Password incorrect"
                )
            return
        }
    }
    
    @IBAction func forgotAlertAction(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(
                title: "Forgot your username?",
                andMessage: "Your username is 'User'"
            )
            : showAlert(
                title: "Forgot your password?",
                andMessage: "Your password is 'Password'"
            )
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        usernameField.text = ""
        passwordField.text = ""
    }
}

// MARK: - Alert Controllers
extension LoginScreenViewController {
    private func showAlert(title: String, andMessage: String) {
        let alert = UIAlertController(title: title, message: andMessage, preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordField.text = ""
        }
        alert.addAction(alertButton)
        present(alert, animated: true)
    }
}
