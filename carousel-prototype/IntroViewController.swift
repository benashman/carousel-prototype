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
        
        let yOffsets : [Float] = [-295, -410, -510, -290, -430, -515]
        let xOffsets : [Float] = [-65, 95, -105, 40, 0, -120]
        let scales   : [Float] = [1, 1.65, 1.9, 1.6, 2, 1.65]
        let rotations: [Float] = [-10, 10, 10, -10, 10, -10]
        
        let scrollProgress = convertValue(scrollView.contentOffset.y, r1Min: -20, r1Max: 568, r2Min: 0, r2Max: 1)
        print(scrollProgress)
        
        let scrollMin = CGFloat(-20)
        let scrollMax = CGFloat(568)
        
        swipePromptLabel.alpha = convertValue(scrollView.contentOffset.y, r1Min: scrollMin, r1Max: scrollMax / 2, r2Min: 1, r2Max: 0)
        
        // PHOTO 1
        
        // position
        photo1.transform = CGAffineTransformMakeTranslation(
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(xOffsets[0]),
                r2Max: 0),
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(yOffsets[0]),
                r2Max: 0))
        
        // scale
        photo1.transform = CGAffineTransformScale(photo1.transform,
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(scales[0]),
                r2Max: 1),
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(scales[0]),
                r2Max: 1))
        
        // rotation
        photo1.transform = CGAffineTransformRotate(photo1.transform,
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(rotations[0]),
                r2Max: 0) * CGFloat(M_PI / 180))
        
        // PHOTO 2
        
        // position
        photo2.transform = CGAffineTransformMakeTranslation(
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(xOffsets[1]),
                r2Max: 0),
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(yOffsets[1]),
                r2Max: 0))
        
        // scale
        photo2.transform = CGAffineTransformScale(photo2.transform,
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(scales[1]),
                r2Max: 1),
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(scales[1]),
                r2Max: 1))
        
        // rotation
        photo2.transform = CGAffineTransformRotate(photo2.transform,
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(rotations[1]),
                r2Max: 0) * CGFloat(M_PI / 180))

        // PHOTO 3
        
        // position
        photo3.transform = CGAffineTransformMakeTranslation(
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(xOffsets[2]),
                r2Max: 0),
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(yOffsets[2]),
                r2Max: 0))
        
        // scale
        photo3.transform = CGAffineTransformScale(photo3.transform,
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(scales[2]),
                r2Max: 1),
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(scales[2]),
                r2Max: 1))
        
        // rotation
        photo3.transform = CGAffineTransformRotate(photo3.transform,
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(rotations[2]),
                r2Max: 0) * CGFloat(M_PI / 180))
        
        // PHOTO 4
        
        // position
        photo4.transform = CGAffineTransformMakeTranslation(
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(xOffsets[3]),
                r2Max: 0),
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(yOffsets[3]),
                r2Max: 0))
        
        // scale
        photo4.transform = CGAffineTransformScale(photo4.transform,
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(scales[3]),
                r2Max: 1),
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(scales[3]),
                r2Max: 1))
        
        // rotation
        photo4.transform = CGAffineTransformRotate(photo4.transform,
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(rotations[3]),
                r2Max: 0) * CGFloat(M_PI / 180))
        
        // PHOTO 5
        
        // position
        photo5.transform = CGAffineTransformMakeTranslation(
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(xOffsets[4]),
                r2Max: 0),
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(yOffsets[4]),
                r2Max: 0))
        
        // scale
        photo5.transform = CGAffineTransformScale(photo5.transform,
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(scales[4]),
                r2Max: 1),
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(scales[4]),
                r2Max: 1))
        
        // rotation
        photo5.transform = CGAffineTransformRotate(photo5.transform,
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(rotations[4]),
                r2Max: 0) * CGFloat(M_PI / 180))
        
        // PHOTO 6
        
        // position
        photo6.transform = CGAffineTransformMakeTranslation(
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(xOffsets[5]),
                r2Max: 0),
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(yOffsets[5]),
                r2Max: 0))
        
        // scale
        photo6.transform = CGAffineTransformScale(photo6.transform,
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(scales[5]),
                r2Max: 1),
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(scales[5]),
                r2Max: 1))
        
        // rotation
        photo6.transform = CGAffineTransformRotate(photo6.transform,
            convertValue(scrollView.contentOffset.y,
                r1Min: scrollMin,
                r1Max: scrollMax,
                r2Min: CGFloat(rotations[5]),
                r2Max: 0) * CGFloat(M_PI / 180))
        
    }
    
}
