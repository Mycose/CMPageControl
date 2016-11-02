//
//  CMPageControl.swift
//  CMPageControl
//
//  Created by Clément Morissard on 26/10/16.
//  Copyright © 2016 Clément Morissard. All rights reserved.
//

import UIKit

@objc public enum CMPageControlOrientation : Int {
    case Horizontal = 0
    case Vertical = 1
}

public protocol CMPageControlDelegate {
    func elementClicked(pageControl : CMPageControl, atIndex: Int)
    func shouldChangeIndex(from : Int, to : Int) -> Bool
}

public class CMPageControl: UIControl {

    // MARK: - PRIVATE PROPERTIES
    fileprivate var currentView : UIView?

    fileprivate var views : [UIView?] = []
    fileprivate var imageViews : [UIImageView?] = []

    fileprivate var buttonWidth : CGFloat = 10.0

    fileprivate func cleanViews() {
        for view in views {
            if let view = view {
                view.removeFromSuperview()
                views[view.tag] = nil
            }
        }
    }

    // MARK: - PUBLIC PROPERTIES
    public var currentIndex : Int = 0 {
        didSet {
            if currentIndex < 0 || currentIndex > numberOfElements-1 { return }

            for view in views {
                if let view = view {
                    if view.tag == currentIndex {
                        currentView = view
                        setSelectedStyleForView(view: view, animated: true)
                    } else {
                        setUnselectedStyleForView(view: view, animated: true)
                    }
                }
            }
        }
    }

    public var numberOfElements : Int = 0 {
        didSet {
            setup()
        }
    }

    public var isRounded : Bool = true {
        didSet {
            for view in views {
                if let view = view {
                    if (isRounded == true) {
                        view.layer.masksToBounds = true
                        view.layer.cornerRadius = elementWidth/2.0
                    } else {
                        view.layer.masksToBounds = false
                        view.layer.cornerRadius = 0
                    }
                }
            }
        }
    }

    public var elementImage : UIImage? {
        didSet {
            setup()
        }
    }

    public var elementBackgroundColor : UIColor = UIColor.white.withAlphaComponent(0.2) {
        didSet {
            for view in views {
                if let view = view, view != currentView {
                    view.backgroundColor = elementBackgroundColor
                }
            }
        }
    }

    public var elementBorderColor : UIColor = UIColor.clear {
        didSet {
            for view in views {
                if let view = view, view != currentView {
                    view.layer.borderColor = elementBorderColor.cgColor
                }
            }
        }
    }

    public var elementBorderWidth : CGFloat = 0.0 {
        didSet {
            for view in views {
                if let view = view, view != currentView {
                    view.layer.borderWidth = elementBorderWidth
                }
            }
        }
    }

    public var elementSelectedImage : UIImage? {
        didSet {
            if let view = currentView as? UIImageView {
                view.image = elementSelectedImage
            }
        }
    }

    public var elementSelectedBackgroundColor : UIColor = UIColor.white {
        didSet {
            if let view = currentView {
                view.backgroundColor = elementSelectedBackgroundColor
            }
        }
    }

    public var elementSelectedBorderColor : UIColor = UIColor.clear {
        didSet {
            if let view = currentView {
                view.layer.borderColor = elementSelectedBorderColor.cgColor
            }
        }
    }

    public var elementSelectedBorderWidth : CGFloat = 0.0 {
        didSet {
            if let view = currentView {
                view.layer.borderWidth = elementSelectedBorderWidth
            }
        }
    }

    public var elementWidth : CGFloat = 7.0 {
        didSet {
            buttonWidth = elementWidth * 1.5
        }
    }

    public var orientation : CMPageControlOrientation = .Horizontal {
        didSet {
            setup()
        }
    }

    public var delegate : CMPageControlDelegate?

    fileprivate func setup() {
        cleanViews()

        let nbSpace : Int = numberOfElements + 1
        var spaceWidth : CGFloat = 0.0
        var xPos : CGFloat = 0.0
        var yPos : CGFloat = 0.0

        views = Array(repeating: nil, count: numberOfElements)
        for i in 0..<numberOfElements {

            if (orientation == .Horizontal) {
                spaceWidth = (frame.width - (CGFloat(numberOfElements) * elementWidth)) / CGFloat(nbSpace)
                xPos = (CGFloat(i) * elementWidth) + (CGFloat(i+1) * spaceWidth)
                yPos = (frame.height - elementWidth) / 2
            } else {
                spaceWidth = (frame.height - (CGFloat(numberOfElements) * elementWidth)) / CGFloat(nbSpace)
                yPos = (CGFloat(i) * elementWidth) + (CGFloat(i+1) * spaceWidth)
                xPos = (frame.width - elementWidth) / 2
            }

            var view : UIView = UIView()

            if let image = elementImage {
                let imageView = UIImageView(frame: CGRect(x: xPos, y: yPos, width: elementWidth, height: elementWidth))
                imageView.contentMode = .scaleAspectFit
                imageView.image = image
                view = imageView
            } else {
                view = UIView(frame: CGRect(x: xPos, y: yPos, width: elementWidth, height: elementWidth))
                view.backgroundColor = elementBackgroundColor
                view.layer.borderColor = elementBorderColor.cgColor
                view.layer.borderWidth = elementBorderWidth
                if (isRounded == true) {
                    view.layer.masksToBounds = true
                    view.layer.cornerRadius = elementWidth/2.0
                }
            }

            let button = UIButton(frame: CGRect(x: 0, y: 0, width: buttonWidth, height: buttonWidth))
            button.center = view.center
            button.tag = i
            button.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)

            addSubview(view)
            addSubview(button)

            view.tag = i
            views[i] = view
        }
        currentIndex = 0
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    @objc fileprivate func buttonClicked(sender : UIButton) {
        let shouldChange = delegate?.shouldChangeIndex(from: currentIndex, to: sender.tag) ?? true
        delegate?.elementClicked(pageControl: self, atIndex: sender.tag)
        if shouldChange == true {
            currentIndex = sender.tag
        }
    }

    fileprivate func setSelectedStyleForView(view : UIView, animated : Bool) {
        if let view = view as? UIImageView {
            if let image = elementSelectedImage {
                view.image = image
            }
        }
        view.backgroundColor = elementSelectedBackgroundColor
        view.layer.borderWidth = elementSelectedBorderWidth
        view.layer.borderColor = elementSelectedBorderColor.cgColor
    }

    fileprivate func setUnselectedStyleForView(view : UIView, animated : Bool) {
        if let view = view as? UIImageView {
            if let image = elementImage {
                view.image = image
            }
        }
        view.backgroundColor = elementBackgroundColor
        view.layer.borderWidth = elementBorderWidth
        view.layer.borderColor = elementBorderColor.cgColor
    }
}
