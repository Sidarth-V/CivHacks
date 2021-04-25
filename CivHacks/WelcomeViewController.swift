//
//  WelcomeViewController.swift
//  CivHacks
//
//  Created by Sidarth V on 24/04/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var LocationField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LocationStyle(textField: LocationField)
    }
    
    func LocationStyle(textField: UITextField){
        
        textField.layer.cornerRadius = 40
        textField.clipsToBounds = false
        textField.layer.shadowOpacity=0.4
        textField.layer.shadowOffset = CGSize(width: 0, height: 0)
        
    }
}
