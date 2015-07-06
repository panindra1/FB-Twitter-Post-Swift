//
//  ViewController.swift
//  SocialSharing
//
//  Created by Panindra Tumkur Seetharamu on 7/6/15.
//  Copyright (c) 2015 Panindra Tumkur Seetharamu. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    @IBOutlet weak var opinionTextField: UITextField!

    @IBOutlet weak var URLTextField: UITextField!
    @IBOutlet weak var shareImageSwitch: UISwitch!

    var postText: String = "Keep calm and feel like a sir"
    var URLToShare: NSURL = NSURL(string: "udacity.com")!
    let imageToShare: UIImage = UIImage(named: "LikeASir")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func postToFacebook(sender: AnyObject) {
        postToSocialMedia(SLServiceTypeFacebook)
    }

    @IBAction func postToTwitter(sender: AnyObject) {
        postToSocialMedia(SLServiceTypeTwitter)
    }

    func postToSocialMedia(typeOfMedia : String) {
        parseTextFields()
        let socailPostViewController = SLComposeViewController(forServiceType: typeOfMedia)
        socailPostViewController.setInitialText(postText)
        socailPostViewController.addURL(URLToShare)

        if(shareImageSwitch.on) {
            socailPostViewController.addImage(imageToShare)
        }
        self.presentViewController(socailPostViewController, animated: true, completion: nil)
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    private func parseTextFields() {

        if (!opinionTextField.text.isEmpty) {
            postText = opinionTextField.text
        }

        if (!URLTextField.text!.isEmpty) {
            URLToShare = NSURL(string: URLTextField.text!)!
        }
    }

}

