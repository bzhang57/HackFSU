//
//  UploadLinkViewController.swift
//  Foodzi
//
//  Created by Bryan Zhang on 3/2/18.
//  Copyright © 2018 Bryan Zhang. All rights reserved.
//

import UIKit

class UploadLinkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var uploadLinkTextField: UITextField!
    
    @IBAction func UploadLinkAction(_ sender: UIButton) {
        let myURLString = "https://www.yellowblissroad.com/baked-chicken-breasts/"
        guard let myURL = NSURL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        
        }
            print("Error: \(error)")
        } catch let error as NSError {
            print("HTML : \(myHTMLString)")
            let myHTMLString = try String(contentsOf: myURL as URL)
         
        do {
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
