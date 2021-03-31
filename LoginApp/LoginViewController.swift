//
//  ViewController.swift
//  LoginApp
//
//  Created by Alex on 31.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let helloScreenVC = segue.destination as? HelloScreenViewController else { return }
        helloScreenVC.welcomeTextAgent = usernameField.text
    }
    
    
    // c log in action у меня глобальная проблема , я провел полночи в гугле , но мне это не помогло , как бы я не менял местами passwordfield и usernamefield , ставил между ними логический оператор , как бы не крутил-вертел весь код , все равно вводя в приложении верное значение для только для поля username (не вводя ничего в password) приложение пропускает дальше / при этом если я убераю упоминание про username , приложение начинает возбуждаться на заполнение/незаполнение поля с паролем . вторую домашнюю подряд у меня ничего не выходит , видимо я безнадежен
    @IBAction func logInAction() {
        if passwordField.text != "Pass" && usernameField.text != "User" {
                showAlert(title: "Wrong !", andMessage: "Your Username or Password incorrect")
        }
    }
    
    
    @IBAction func forgotNameAlertAction() {
        forgotAlert(title: "Don't Worry!", andMessage: "Your username is 'User'")
    }
    
    @IBAction func forgotPasswordAlertAction() {
        forgotAlert(title: "Don't Worry!", andMessage: "Your password is 'Pass'")
    }
    
}

// MARK: - Alert Controllers
extension ViewController {
    private func showAlert(title: String, andMessage: String) {
        let alert = UIAlertController(title: title, message: andMessage, preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "OK", style: .cancel) { _ in
            self.usernameField.text = ""
            self.passwordField.text = ""
        }
        alert.addAction(alertButton)
        present(alert, animated: true)
    }
    
    private func forgotAlert(title: String, andMessage: String) {
        let alert = UIAlertController(title: title, message: andMessage, preferredStyle: .actionSheet)
        let alertButton = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(alertButton)
        present(alert, animated: true)
    }
}
