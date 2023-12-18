//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Iliyas Shakhabdin on 18.12.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var resultTotal = ""
    var numberOfPeople = 2
    var tip = 0.10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(resultTotal)
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(Int(tip*100))% tip."
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
