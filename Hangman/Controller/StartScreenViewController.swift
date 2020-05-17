//
//  StartScreenViewController.swift
//  Hangman
//
//  Created by Trevor Williams on 10/17/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func newGame(_ sender: Any) {
        performSegue(withIdentifier: "startToMain",
        sender: sender)

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
