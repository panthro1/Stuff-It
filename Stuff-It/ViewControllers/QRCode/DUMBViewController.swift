//
//  DUMBViewController.swift
//  Stuff-It
//
//  Created by Michael King on 5/17/17.
//  Copyright © 2017 Microideas. All rights reserved.
//

import UIKit

class DUMBViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pop(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)

    }

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
