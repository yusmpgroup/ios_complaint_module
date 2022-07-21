//
//  JJComplainSuccess.swift
//  JoyJet
//
//  Created by Борис Окурин on 01.02.2022.
//

import UIKit

class JJComplainSuccess: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onDone(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

}
