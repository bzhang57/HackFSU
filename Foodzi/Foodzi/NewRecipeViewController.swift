//
//  NewRecipeViewController.swift
//  Foodzi
//
//  Created by Bryan Zhang on 3/2/18.
//  Copyright © 2018 Bryan Zhang. All rights reserved.
//

import UIKit

class NewRecipeViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var UploadLinkButton: UIButton!
    @IBOutlet weak var CreateNewRecipeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func myUnwindActionUploadToNewRecipe(unwindSegue: UIStoryboardSegue) {}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
