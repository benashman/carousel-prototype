//
//  IntroViewController.swift
//  carousel-prototype
//
//  Created by Ben Ashman on 10/27/15.
//  Copyright © 2015 Ben Ashman. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var photo3: UIImageView!
    @IBOutlet weak var photo4: UIImageView!
    @IBOutlet weak var photo5: UIImageView!
    @IBOutlet weak var photo6: UIImageView!
    
    @IBOutlet weak var swipePromptLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self
        
        setUpInitialPhotoStates()
    }
    
    func setUpInitialPhotoStates() {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let photos: [UIImageView] = [photo1, photo2, photo3, photo4, photo5, photo6]
        
        let yOffsets : [Float] = [-295, -410, -510, -290, -430, -515]
        let xOffsets : [Float] = [-65, 95, -105, 40, 0, -120]
        let scales   : [Float] = [1, 1.65, 1.9, 1.6, 2, 1.65]
        let rotations: [Float] = [-10, 10, 10, -10, 10, -10]

        let scrollOffset = Float(scrollView.contentOffset.y)
        let scrollOffsetMax = Float(573.0)
        let scrollOffsetMin = Float(-25.0)
        
        // Cap scroll offset
        var cappedOffset = scrollOffset

        if scrollOffset < scrollOffsetMin {
            cappedOffset = scrollOffsetMin
        } else if scrollOffset > scrollOffsetMax {
            cappedOffset = scrollOffsetMax
        } else {
            cappedOffset = scrollOffset
        }
        
        let scrollMin = CGFloat(-20)
        let scrollMax = CGFloat(568)
        
        // Transform photos
        for (i, photo) in photos.enumerate() {
            photo.transform = CGAffineTransformMakeTranslation(
                convertValue(CGFloat(cappedOffset),
                    r1Min: scrollMin,
                    r1Max: scrollMax,
                    r2Min: CGFloat(xOffsets[i]),
                    r2Max: 0),
                convertValue(CGFloat(cappedOffset),
                    r1Min: scrollMin,
                    r1Max: scrollMax,
                    r2Min: CGFloat(yOffsets[i]),
                    r2Max: 0))
            
            photo.transform = CGAffineTransformScale(photo.transform,
                convertValue(CGFloat(cappedOffset),
                    r1Min: scrollMin,
                    r1Max: scrollMax,
                    r2Min: CGFloat(scales[i]),
                    r2Max: 1),
                convertValue(CGFloat(cappedOffset),
                    r1Min: scrollMin,
                    r1Max: scrollMax,
                    r2Min: CGFloat(scales[i]),
                    r2Max: 1))
            
            photo.transform = CGAffineTransformRotate(photo.transform,
                convertValue(CGFloat(cappedOffset),
                    r1Min: scrollMin,
                    r1Max: scrollMax,
                    r2Min: CGFloat(rotations[i]),
                    r2Max: 0) * CGFloat(M_PI / 180))
        }
        
        // Fade out swipe prompt
        swipePromptLabel.alpha = convertValue(scrollView.contentOffset.y, r1Min: scrollMin, r1Max: scrollMax / 2, r2Min: 1, r2Max: 0)
    }
    
}
