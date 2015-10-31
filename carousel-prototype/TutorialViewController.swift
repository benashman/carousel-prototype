//
//  TutorialViewController.swift
//  carousel-prototype
//
//  Created by Ben Ashman on 10/31/15.
//  Copyright © 2015 Ben Ashman. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageIndicator: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(1280, 568)
        scrollView.frame = CGRectMake(0, 0, 320, 568)
        scrollView.showsHorizontalScrollIndicator = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let currentPage = Int(round(scrollView.contentOffset.x / 320))
        pageIndicator.currentPage = currentPage
    }
    
}
