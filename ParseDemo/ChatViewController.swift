//
//  ChatViewController.swift
//  ParseDemo
//
//  Created by Rajiv Deshmukh on 7/28/16.
//  Copyright © 2016 Rajiv Deshmukh. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var composeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func composeMessageAction(sender: AnyObject) {
        
        var message = PFObject(className:"Message_iOSFeb2016")
        
        message["text"] = self.messageTextField.text
        
        message.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                NSLog("Message Successfully Saved")
            } else {
                // There was a problem, check error.description
            }
        }

    }

}
