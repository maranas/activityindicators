//
//  GLSImageRotationsActivityIndicatorView.swift
//  activityindicators
//
//  Created by Moises Anthony Aranas on 7/13/15.
//  Copyright © 2015 ganglion software. All rights reserved.
//

import UIKit

/**
**GLSImageRotationsActivityIndicatorView**

A view that displays a rotating image activity indicator.
*/

class GLSImageRotationsActivityIndicatorView: UIView {
    fileprivate var animating : Bool = false
    fileprivate weak var imageView : UIImageView?
    fileprivate var yAnimation : CAKeyframeAnimation?
    fileprivate var xAnimation : CAKeyframeAnimation?
    
    /**
    If true, the activity indicator becomes hidden when stopped.
    */
    var hidesWhenStopped : Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override required init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    /**
    Common initializer logic for the spin indicator.
    */
    fileprivate func commonInit() {
        let imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView)
        self.imageView = imageView
    }
    
    /**
    Sets the image to use for the progress indicator.
    
    *image* - A UIImage to use for the progress indicator.
    */
    func setImage(_ image:UIImage)
    {
        self.imageView?.image = image
    }
    
    /**
    Starts the image rotation animation.
    */
    func startAnimating() {
        if self.isAnimating()
        {
            return
        }
        self.layer.isHidden = false
        self.animating = true
        
        self.layer.transform.m34 = 1.0 / -300
        
        self.yAnimation = CAKeyframeAnimation(keyPath:"transform.rotation.y")
        self.yAnimation?.values = [0, Double.pi, Double.pi, 2*Double.pi, 2*Double.pi]
        self.yAnimation?.keyTimes = [0, 0.2, 0.4, 0.8, 1.0]
        self.yAnimation?.calculationMode = kCAAnimationLinear
        
        self.xAnimation = CAKeyframeAnimation(keyPath:"transform.rotation.x")
        self.xAnimation?.values = [0, 0, Double.pi, Double.pi, 2*Double.pi]
        self.xAnimation?.keyTimes = [0, 0.2, 0.4, 0.8, 1.0]
        self.xAnimation?.calculationMode = kCAAnimationLinear
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [self.yAnimation!, self.xAnimation!]
        animationGroup.duration = 3.0
        animationGroup.repeatCount = Float.infinity
        
        self.layer.add(animationGroup, forKey: "rotation")
    }
    
    /**
    Stops the image rotation animation.
    */
    func stopAnimating() {
        if !self.isAnimating()
        {
            return
        }
        self.animating = false
        self.layer.isHidden = self.hidesWhenStopped
        self.layer.removeAllAnimations()
    }
    
    /**
    Returns if the rotation indicator is animating.
    
    *returns* - A boolean indicator if the animation is in progress.
    */
    func isAnimating() -> Bool {
        return self.animating
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = self.layer.bounds
        self.imageView?.frame = self.layer.bounds
    }
}
