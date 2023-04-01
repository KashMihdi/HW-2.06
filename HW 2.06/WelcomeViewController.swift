//
//  WelcomViewController.swift
//  HW 2.06
//
//  Created by Kasharin Mikhail on 01.04.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = userName
    }
    
    @IBAction func logOutTapped() {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    
}
