//
//  LoginViewController.swift
//  carousel-prototype
//
//  Created by Ben Ashman on 10/29/15.
//  Copyright © 2015 Ben Ashman. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 600)
        
        // Register for keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didTapBackButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func didTapSignInButton(sender: AnyObject) {
        let dummyEmail = "hello@benashman.me"
        let dummyPassword = "averysecurepassword"
        
        if emailField.text == "" || passwordField.text == "" {
            // Empty fields
            let missingCredentialsAlertController = UIAlertController(title: "You missed something", message: "Please enter your email and password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in }
            missingCredentialsAlertController.addAction(cancelAction)
            presentViewController(missingCredentialsAlertController, animated: true, completion: nil)
        } else {
            spinner.startAnimating()
            
            delay(2.0) {
                if self.emailField.text == dummyEmail && self.passwordField.text == dummyPassword {
                    print("success!")
                } else {
                    // Unsuccessful login
                    print("nope!")
                    let unsuccessfulAlertController = UIAlertController(title: "Something is wrong", message: "Email or password is incorrect", preferredStyle: .Alert)
                    let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in }
                    unsuccessfulAlertController.addAction(cancelAction)
                    self.presentViewController(unsuccessfulAlertController, animated: true, completion: nil)
                }
                
                self.spinner.stopAnimating()
            }
        }
    }

    func keyboardWillShow(notification: NSNotification!) {
        let maximumContentOffsetY = scrollView.contentSize.height - scrollView.frame.size.height
        
        buttonParentView.transform = CGAffineTransformMakeTranslation(0, -110)
        
        scrollView.contentOffset.y = maximumContentOffsetY
        scrollView.scrollEnabled = true
    }

    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.transform = CGAffineTransformIdentity
        scrollView.contentOffset.y = 0
        scrollView.scrollEnabled = false
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let keyboardVisibleThreshold = CGFloat(75.0)
        
        if scrollView.contentOffset.y <= keyboardVisibleThreshold {
            view.endEditing(true)
        }
    }
}
