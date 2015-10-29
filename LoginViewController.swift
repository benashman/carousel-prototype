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
