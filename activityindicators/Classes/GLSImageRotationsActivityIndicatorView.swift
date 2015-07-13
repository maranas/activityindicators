//
//  GLSImageRotationsActivityIndicatorView.swift
//  activityindicators
//
//  Created by Moises Anthony Aranas on 7/13/15.
//  Copyright © 2015 ganglion software. All rights reserved.
//

import UIKit

class GLSImageRotationsActivityIndicatorView: UIView {
    private var animating : Bool = false
    private weak var imageView : UIImageView?
    private var yAnimation : CAKeyframeAnimation?
    private var xAnimation : CAKeyframeAnimation?
    
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
    private func commonInit() {
        let imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView)
        self.imageView = imageView
    }
    
    /**
    Sets the image to use for the progress indicator.
    
    *image* - A UIImage to use for the progress indicator.
    */
    func setImage(image:UIImage)
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
        self.layer.hidden = false
        self.animating = true
        
        self.animating = true
        self.layer.transform.m34 = 1.0 / -300
        
        self.yAnimation = CAKeyframeAnimation(keyPath:"transform.rotation.y")
        self.yAnimation?.values = [0, M_PI, M_PI, 2*M_PI, 2*M_PI]
        self.yAnimation?.keyTimes = [0, 0.2, 0.4, 0.8, 1.0]
        self.yAnimation?.calculationMode = kCAAnimationLinear
        
        self.xAnimation = CAKeyframeAnimation(keyPath:"transform.rotation.x")
        self.xAnimation?.values = [0, 0, M_PI, M_PI, 2*M_PI]
        self.xAnimation?.keyTimes = [0, 0.2, 0.4, 0.8, 1.0]
        self.xAnimation?.calculationMode = kCAAnimationLinear
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [self.yAnimation!, self.xAnimation!]
        animationGroup.duration = 3.0
        animationGroup.repeatCount = Float.infinity
        
        self.layer.addAnimation(animationGroup, forKey: "rotation")
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
        self.layer.hidden = self.hidesWhenStopped
        self.layer.removeAllAnimations()
    }
    
    /**
    Returns if the spin indicator is animating.
    
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
