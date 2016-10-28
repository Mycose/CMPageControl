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

    fileprivate var buttonWidth : CGFloat = 16.0

    fileprivate func cleanViews() {
        for view in self.views {
            if let view = view {
                view.removeFromSuperview()
                views[view.tag] = nil
            }
        }
    }

    // MARK: - PUBLIC PROPERTIES
    public var currentIndex : Int = 0 {
        didSet {
            if self.currentIndex < 0 || self.currentIndex > self.numberOfElements-1 { return }

            for view in self.views {
                if let view = view {
                    if view.tag == self.currentIndex {
                        self.currentView = view
                        self.setSelectedStyleForView(view: view, animated: true)
                    } else {
                        self.setUnselectedStyleForView(view: view, animated: true)
                    }
                }
            }
        }
    }

    public var numberOfElements : Int = 0 {
        didSet {
            self.setup()
        }
    }

    public var isRounded : Bool = true {
        didSet {
            for view in self.views {
                if let view = view {
                    if (self.isRounded == true) {
                        view.layer.masksToBounds = true
                        view.layer.cornerRadius = self.elementWidth/2.0
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
            self.setup()
        }
    }

    public var elementBackgroundColor : UIColor = UIColor.gray {
        didSet {
            for view in self.views {
                if let view = view, view != self.currentView {
                    view.backgroundColor = self.elementBackgroundColor
                }
            }
        }
    }

    public var elementBorderColor : UIColor = UIColor.gray {
        didSet {
            for view in self.views {
                if let view = view, view != self.currentView {
                    view.layer.borderColor = self.elementBorderColor.cgColor
                }
            }
        }
    }

    public var elementBorderWidth : CGFloat = 1.0 {
        didSet {
            for view in self.views {
                if let view = view, view != self.currentView {
                    view.layer.borderWidth = self.elementBorderWidth
                }
            }
        }
    }

    public var elementSelectedImage : UIImage? {
        didSet {
            if let view = self.currentView as? UIImageView {
                view.image = self.elementSelectedImage
            }
        }
    }

    public var elementSelectedBackgroundColor : UIColor = UIColor.white {
        didSet {
            if let view = self.currentView {
                view.backgroundColor = self.elementSelectedBackgroundColor
            }
        }
    }

    public var elementSelectedBorderColor : UIColor = UIColor.white {
        didSet {
            if let view = self.currentView {
                view.layer.borderColor = self.elementSelectedBorderColor.cgColor
            }
        }
    }

    public var elementSelectedBorderWidth : CGFloat = 2.0 {
        didSet {
            if let view = self.currentView {
                view.layer.borderWidth = self.elementSelectedBorderWidth
            }
        }
    }

    public var elementWidth : CGFloat = 10.0 {
        didSet {
            self.buttonWidth = self.elementWidth * 1.5
        }
    }

    public var orientation : CMPageControlOrientation = .Horizontal {
        didSet {
            self.setup()
        }
    }

    public var delegate : CMPageControlDelegate?

    fileprivate func setup() {
        self.cleanViews()

        let nbSpace : Int = self.numberOfElements + 1
        var spaceWidth : CGFloat = 0.0
        var xPos : CGFloat = 0.0
        var yPos : CGFloat = 0.0

        views = Array(repeating: nil, count: self.numberOfElements)
        for i in 0..<self.numberOfElements {

            if (self.orientation == .Horizontal) {
                spaceWidth = (self.frame.width - (CGFloat(self.numberOfElements) * self.elementWidth)) / CGFloat(nbSpace)
                xPos = (CGFloat(i) * self.elementWidth) + (CGFloat(i+1) * spaceWidth)
                yPos = (self.frame.height - self.elementWidth) / 2
            } else {
                spaceWidth = (self.frame.height - (CGFloat(self.numberOfElements) * self.elementWidth)) / CGFloat(nbSpace)
                yPos = (CGFloat(i) * self.elementWidth) + (CGFloat(i+1) * spaceWidth)
                xPos = (self.frame.width - self.elementWidth) / 2
            }

            var view : UIView = UIView()

            if let image = self.elementImage {
                let imageView = UIImageView(frame: CGRect(x: xPos, y: yPos, width: self.elementWidth, height: self.elementWidth))
                imageView.contentMode = .scaleAspectFit
                imageView.image = image
                view = imageView
            } else {
                view = UIView(frame: CGRect(x: xPos, y: yPos, width: self.elementWidth, height: self.elementWidth))
                view.backgroundColor = self.elementBackgroundColor
                view.layer.borderColor = self.elementBorderColor.cgColor
                view.layer.borderWidth = self.elementBorderWidth
                if (self.isRounded == true) {
                    view.layer.masksToBounds = true
                    view.layer.cornerRadius = self.elementWidth/2.0
                }
            }

            let button = UIButton(frame: CGRect(x: 0, y: 0, width: self.buttonWidth, height: self.buttonWidth))
            button.center = view.center
            button.tag = i
            button.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)

            self.addSubview(view)
            self.addSubview(button)

            view.tag = i
            views[i] = view
        }
        self.currentIndex = 0
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    @objc fileprivate func buttonClicked(sender : UIButton) {
        let shouldChange = self.delegate?.shouldChangeIndex(from: self.currentIndex, to: sender.tag) ?? true
        self.delegate?.elementClicked(pageControl: self, atIndex: sender.tag)
        if shouldChange == true {
            self.currentIndex = sender.tag
        }
    }

    fileprivate func setSelectedStyleForView(view : UIView, animated : Bool) {
        if let view = view as? UIImageView {
            if let image = self.elementSelectedImage {
                view.image = image
            }
        }
        view.backgroundColor = self.elementSelectedBackgroundColor
        view.layer.borderWidth = self.elementSelectedBorderWidth
        view.layer.borderColor = self.elementSelectedBorderColor.cgColor
    }

    fileprivate func setUnselectedStyleForView(view : UIView, animated : Bool) {
        if let view = view as? UIImageView {
            if let image = self.elementImage {
                view.image = image
            }
        }
        view.backgroundColor = self.elementBackgroundColor
        view.layer.borderWidth = self.elementBorderWidth
        view.layer.borderColor = self.elementBorderColor.cgColor
    }
}
