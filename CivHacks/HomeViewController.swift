//
//  HomeViewController.swift
//  CivHacks
//
//  Created by Sidarth V on 25/04/21.
//

import UIKit

struct Hospitals {
    var Name = "Name"
    var Address = "Address"
    var Time = "100"
}

class HomeViewController: UIViewController {
    
    var SelectedName:String = ""
    @IBOutlet weak var EmergencyCall: UIButton!
    @IBOutlet weak var LabelField: UILabel!
    @IBOutlet weak var VaccinationCall: UIButton!
    @IBOutlet weak var AppointmentsCall: UIButton!
    @IBOutlet weak var OpenButton: UIButton!
    @IBOutlet weak var AddressField: UILabel!
    @IBOutlet weak var DirectionsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LabelField.text = SelectedName
        OpenButton.layer.cornerRadius = 20
        DirectionsButton.layer.cornerRadius = 20
        EmergencyCall.layer.cornerRadius = 20
        VaccinationCall.layer.cornerRadius = 20
        AppointmentsCall.layer.cornerRadius = 20
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
