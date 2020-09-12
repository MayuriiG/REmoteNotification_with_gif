//
//  NextViewController.swift
//  LOcalNotifcation_case1
//
//  Created by Mayurii Gajbhiye on 12/09/20.
//  Copyright © 2020 Mayurii Gajbhiye. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var userName_lbl: UILabel!
  
    var textString = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        userName_lbl.text = textString



        // Do any additional setup after loading the view.
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
