//
//  PasscodeSignPlaceholderView.swift
//  PasscodeLock
//
//  Created by Yanko Dimitrov on 8/28/15.
//  Copyright © 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit

@IBDesignable
open class PasscodeSignPlaceholderView: UIView {
    
    public enum State {
        case inactive
        case active
        case error
    }
    
    @IBInspectable
    open var inactiveColor: UIColor = UIColor.white {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable
    open var activeColor: UIColor = UIColor.gray {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable
    open var errorColor: UIColor = UIColor.red {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable
    open var dotSize: CGFloat = 15
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupView()
    }
    
    @IBInspectable
    open var titleActiveColor: UIColor = UIColor.black
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    open override var intrinsicContentSize : CGSize {
        return CGSize(width: dotSize, height: dotSize)
    }
    
    fileprivate func setupView() {
        
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = inactiveColor.cgColor
        backgroundColor = inactiveColor
    }
    
    fileprivate func colorsForState(_ state: State) -> (backgroundColor: UIColor, borderColor: UIColor) {
        
        switch state {
        case .inactive: return (inactiveColor, inactiveColor)
        case .active: return (activeColor, activeColor)
        case .error: return (errorColor, errorColor)
        }
    }
    
    open func animateState(_ state: State) {
        
        let colors = colorsForState(state)
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            options: [],
            animations: {
                
                self.backgroundColor = colors.backgroundColor
                self.layer.borderColor = colors.borderColor.cgColor
                
            },
            completion: nil
        )
    }
}
