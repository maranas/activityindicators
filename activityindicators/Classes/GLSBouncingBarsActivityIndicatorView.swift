//
//  GLSBouncingBarsActivityIndicatorView.swift
//  activityindicators
//
//  Created by Moises Anthony Aranas on 7/13/15.
//  Copyright © 2015 ganglion software. All rights reserved.
//

import UIKit

/**
**GLSBouncingBarsActivityIndicatorView**

A view that displays bouncing bars as an activity indicator.
*/

class GLSBouncingBarsActivityIndicatorView: UIView {
    private var animating : Bool = false
    private var _color : UIColor? = UIColor.grayColor()
    
    /**
    If true, the activity indicator becomes hidden when stopped.
    */
    var hidesWhenStopped : Bool = false
    var bars : [UIView] = []
    
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
                for index in 0...3
                {
                    let currentBar : UIView = self.bars[index]
                    currentBar.backgroundColor = unwrappedColor
                }
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
    Common initializer logic for the bouncing bars indicator.
    */
    private func commonInit() {
        self.backgroundColor = UIColor.clearColor()
        let barWidth = self.bounds.size.width / 5
        let barHeight = self.bounds.size.height
        let barSpacing = barWidth/3
        var currX : CGFloat = 0.0
        let currY : CGFloat = 0.0
        for _ in 0...3
        {
            let currView : UIView = UIView(frame: CGRectMake(currX, currY, barWidth, barHeight))
            self.bars.append(currView)
            currX += barWidth + barSpacing
            self.addSubview(currView)
        }
    }
    
    /**
    Starts the bouncing bars animation.
    */
    func startAnimating() {
        if self.isAnimating()
        {
            return
        }
        self.layer.hidden = false
        self.animating = true
        
        var animationMin = 0.2
        let animationDiffs = (1.0 - animationMin) / Double(self.bars.count)
        let animationKeyframeDiffs = 1.0 / Double(self.bars.count)
        for index in 0...3
        {
            let currentBar : UIView = self.bars[index]
            let animation = CAKeyframeAnimation(keyPath: "transform.scale.y")
            var values : [Double] = []
            var startValue = animationMin
            for _ in 0...self.bars.count
            {
                if startValue > 1.0
                {
                    startValue = 0.2
                }
                values.append(startValue)
                startValue += animationDiffs
            }
            animationMin += animationDiffs
            animation.values = values
            var animationStart = 0.0
            var keyFrames : [Double] = []
            for _ in 0...self.bars.count
            {
                keyFrames.append(animationStart)
                animationStart += animationKeyframeDiffs
            }
            animation.keyTimes = keyFrames
            animation.calculationMode = kCAAnimationPaced
            animation.repeatCount = Float.infinity
            animation.duration = 0.5
            animation.autoreverses = true
            currentBar.layer.addAnimation(animation, forKey: "animation\(index)")
        }
    }
    
    /**
    Stops the bouncing bars animation.
    */
    func stopAnimating() {
        if !self.isAnimating()
        {
            return
        }
        self.animating = false
        self.layer.hidden = self.hidesWhenStopped
        for index in 0...3
        {
            let currentBar : UIView = self.bars[index]
            currentBar.layer.removeAllAnimations()
        }
    }
    
    /**
    Returns if the bouncing bars is animating.
    
    *returns* - A boolean indicator if the animation is in progress.
    */
    func isAnimating() -> Bool {
        return self.animating
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let barWidth = self.bounds.size.width / 5
        let barHeight = self.bounds.size.height
        let barSpacing = barWidth/3
        var currX : CGFloat = 0.0
        let currY : CGFloat = 0.0
        for index in 0...3
        {
            let currentBar : UIView = self.bars[index]
            currentBar.frame = CGRectMake(currX, currY, barWidth, barHeight)
            currX += barWidth + barSpacing
        }
    }
}
