//
//  RecipeStepsViewController.swift
//  Foodzi
//
//  Created by Bryan Zhang on 3/2/18.
//  Copyright © 2018 Bryan Zhang. All rights reserved.
//

import UIKit

class RecipeStepsViewController: UIViewController {
    
    var directions = [String]()
    var ingredients = [String]()
    var step = 0
    var nameText = ""
    
    @IBOutlet weak var forward: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var instruction: UILabel!
    @IBOutlet weak var stepNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instruction.text = directions[0]
        name.text = nameText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func next(_ sender: Any) {
        step += 1
        if (step >= directions.count) {
            print("finish")
        } else {
            instruction.text = directions[step]
            stepNumber.text = String(step) + " / " + String(directions.count)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        step -= 1
        if (step >= 0) {
            instruction.text = directions[step]
        }
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
