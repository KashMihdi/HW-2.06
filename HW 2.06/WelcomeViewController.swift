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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackgroundColor()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = userName
    }
    
    
    private func setGradientBackgroundColor() {
        let colorTop = UIColor(
            red: 128 / 255,
            green: 0 / 255,
            blue: 128 / 255,
            alpha: 1
        ).cgColor
        let colorBottom = UIColor(
            red: 0 / 255,
            green: 255 / 255,
            blue: 255 / 255,
            alpha: 1
        ).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
