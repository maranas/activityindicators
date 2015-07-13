//
//  GLSSpinActivityIndicatorView.swift
//  activityindicators
//
//  Created by Moises Anthony Aranas on 7/12/15.
//  Copyright © 2015 ganglion software. All rights reserved.
//

import UIKit

class GLSSpinActivityIndicatorView: UIView {
    private var _color : UIColor? = UIColor.redColor()
    private var progressLayer : CAShapeLayer?
    private var progressPath : CAShapeLayer?
    private var animating : Bool = false
    private var animation : CABasicAnimation?
    private var hideSpinnerPath : Bool = false
    
    /**
    If true, the activity indicator becomes hidden when stopped.
     */
    var hidesWhenStopped : Bool = false
    
    /**
    The color to be used for the indicator.
    */
    var color : UIColor? {
        get
        {
            return _color!
        }
        set
        {
            _color = newValue
            if let unwrappedColor = _color {
                self.progressLayer?.strokeColor = unwrappedColor.CGColor
                self.progressPath?.strokeColor = unwrappedColor.colorWithAlphaComponent(0.2).CGColor
            }
        }
    }
    
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
        self.backgroundColor = UIColor.clearColor()
        let arcCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        let radius = min(CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds))/2
        let circlePath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: CGFloat(0), endAngle: CGFloat(2*M_PI), clockwise: true)
        self.progressLayer = CAShapeLayer()
        self.progressLayer?.frame = self.layer.bounds
        self.progressLayer?.path = circlePath.CGPath
        self.progressLayer?.fillColor = UIColor.clearColor().CGColor
        self.progressLayer?.lineWidth = 6.0
        self.progressLayer?.strokeStart = 0.0
        self.progressLayer?.strokeEnd = 0.3
        
        // background path
        self.progressPath = CAShapeLayer()
        self.progressPath?.path = circlePath.CGPath
        self.progressPath?.frame = self.layer.bounds
        self.progressPath?.fillColor = UIColor.clearColor().CGColor
        self.progressPath?.lineWidth = 6.0
        
        // color
        if let unwrappedColor = _color {
            self.progressLayer?.strokeColor = unwrappedColor.CGColor
            self.progressPath?.strokeColor = unwrappedColor.colorWithAlphaComponent(0.2).CGColor
        }
        
        self.layer.addSublayer(self.progressPath!)
        self.layer.addSublayer(self.progressLayer!)
    }
    
    /**
    Sets the size of the arc, in terms of a fraction of a circle.
    
    *arcSize* - A CGFloat from 0.0 to 1.0.
    */
    func setSpinningArcSize(arcSize:CGFloat) {
        self.progressLayer?.strokeEnd = arcSize
    }
    
    /**
    Sets the visibility of the background circle path of the indicator.
    
    *showPath* - A boolean that indicates the path's visibility.
    */
    func showArcPath(showPath:Bool) {
        self.hideSpinnerPath = !showPath
        self.progressPath?.hidden = !showPath
    }
    
    /**
    Sets the progress indicator line width.
    
    *arcWidth* - A CGFloat to use as width for drawing the indicator.
    */
    func setArcWidth(arcWidth:CGFloat) {
        self.progressLayer?.lineWidth = arcWidth
        self.progressPath?.lineWidth = arcWidth
    }
    
    /**
    Starts the spin animation.
    */
    func startAnimating() {
        if self.isAnimating()
        {
            return
        }
        self.progressLayer?.hidden = false
        if (!self.hideSpinnerPath)
        {
            self.progressPath?.hidden = false
        }
        self.animating = true
        self.animation = CABasicAnimation(keyPath:"transform.rotation.z")
        self.animation?.duration = 1.0
        self.animation?.removedOnCompletion = false
        self.animation?.fromValue = 0.0
        self.animation?.toValue = 2*M_PI
        self.animation?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        self.animation?.repeatCount = Float.infinity
        self.progressLayer?.addAnimation(self.animation!, forKey: "progressAnimation")

    }
    
    /**
    Stops the spin animation.
    */
    func stopAnimating() {
        if !self.isAnimating()
        {
            return
        }
        self.animating = false
        self.progressLayer?.hidden = self.hidesWhenStopped
        if (!self.hideSpinnerPath)
        {
            self.progressPath?.hidden = self.hidesWhenStopped
        }
        self.progressLayer?.removeAnimationForKey("progressAnimation")
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
        self.progressLayer?.frame = self.layer.bounds
        self.progressPath?.frame = self.layer.bounds
    }
}
