//
//  LearnMoreViewController.swift
//  carousel-prototype
//
//  Created by Ben Ashman on 10/31/15.
//  Copyright © 2015 Ben Ashman. All rights reserved.
//

import UIKit

class LearnMoreViewController: UIViewController {

    var didViewPhotoFullScreen: Bool = false
    var didUseTimeWheel: Bool = false
    var didSharePhoto: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapCloseButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
