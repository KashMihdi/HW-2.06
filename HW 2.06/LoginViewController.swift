//
//  LoginViewController.swift
//  HW 2.06
//
//  Created by Kasharin Mikhail on 01.04.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var forgotNameLabel: UIButton!
    
    private let userName = "1"
    private let userPassword = "1"
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = "Welcome, \(userNameTF.text ?? "")!"
    }
    
    @IBAction func logInTapped() {
        guard let name = userNameTF.text, let password = passwordTF.text else { return }
        
        if name.isEmpty || password.isEmpty {
            showAlert(
                tittle: "Input Error",
                message: "Please enter login and password "
            )
            return
        }
        if name != userName || password != userPassword {
            showAlert(
                tittle: "Invalid login or password",
                message: "Please, enter correct login and password"
            )
            return
        }
        
        performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
    }
    
    @IBAction func promptButtonTapped(_ sender: UIButton) {
        switch sender {
        case forgotNameLabel:
            showAlert(tittle: "Oops!", message: "Your name is 1")
        default:
            showAlert(tittle: "Oops!", message: "Your password is 1")
        }
    }
    
    @IBAction func unwindSegueToLoginVC(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
}

extension LoginViewController {
    private func showAlert(tittle: String, message: String) {
        let alert = UIAlertController(
            title: tittle,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let field = self.passwordTF.text, !field.isEmpty {
                self.passwordTF.text = ""
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
