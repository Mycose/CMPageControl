//
//  ViewController.swift
//  CMPageControl
//
//  Created by Clément Morissard on 26/10/16.
//  Copyright © 2016 Clément Morissard. All rights reserved.
//

import UIKit
import CMPageControl

class ViewController: UIViewController {

    var pageControl : CMPageControl?
    var pageControl1 : CMPageControl?
    var pageControl2 : CMPageControl?
    var pageControl3 : CMPageControl?
    var pageControl4 : CMPageControl?
    @IBOutlet var pageControl5 : CMPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let image = UIImage(named: "icon-star.png")
        let selectedImage = UIImage(named: "icon-star-blue.png")

        pageControl = CMPageControl(frame: CGRect(x: 0, y: 40, width: 40, height: 200))
        pageControl?.numberOfElements = 5
        pageControl?.elementImage = image
        pageControl?.elementSelectedImage = selectedImage
        pageControl?.elementBackgroundColor = UIColor.clear
        pageControl?.elementWidth = 20.0
        pageControl?.elementBorderWidth = 0.0
        pageControl?.elementSelectedBorderWidth = 0.0
        pageControl?.elementSelectedBackgroundColor = UIColor.clear
        pageControl?.orientation = .Vertical
        view.addSubview(pageControl!)

        pageControl1 = CMPageControl(frame: CGRect(x: 40, y: 40, width: 300, height: 40))
        pageControl1?.numberOfElements = 8
        pageControl1?.elementBackgroundColor = UIColor(red: 8.0/255.0, green: 103.0/255.0, blue: 146.0/255.0, alpha: 1.0)
        pageControl1?.elementWidth = 16.0
        pageControl1?.elementCornerRadius = 8.0
        pageControl1?.elementBorderWidth = 0.0
        pageControl1?.elementSelectedBorderWidth = 0.0
        pageControl1?.elementSelectedBackgroundColor = UIColor(red: 47.0/255.0, green: 143.0/255.0, blue: 176.0/255.0, alpha: 1.0)
        pageControl1?.orientation = .Horizontal
        view.addSubview(pageControl1!)

        pageControl2 = CMPageControl(frame: CGRect(x: 60, y: 160, width: 250, height: 50))
        pageControl2?.numberOfElements = 7
        pageControl2?.elementBackgroundColor = UIColor.darkGray
        pageControl2?.elementWidth = 20.0
        pageControl2?.elementBorderWidth = 0.0
        pageControl2?.elementSelectedBorderWidth = 1.0
        pageControl2?.elementSelectedBackgroundColor = UIColor.gray
        pageControl2?.elementSelectedBorderColor = UIColor.white
        pageControl2?.orientation = .Horizontal
        view.addSubview(pageControl2!)

        pageControl3 = CMPageControl(frame: CGRect(x: 0, y: 350, width: 200, height: 30))
        pageControl3?.numberOfElements = 7
        view.addSubview(pageControl3!)

        pageControl4 = CMPageControl(frame: CGRect(x: 60, y: 400, width: 300, height: 40))
        pageControl4?.numberOfElements = 7
        pageControl4?.elementBackgroundColor = UIColor(red: 206.0/255.0, green: 0.0, blue: 86.0/255.0, alpha: 1.0)
        pageControl4?.elementWidth = 30
        pageControl4?.isRounded = false
        pageControl4?.elementBorderWidth = 0.0
        pageControl4?.elementSelectedBorderWidth = 0.0
        pageControl4?.elementSelectedBackgroundColor = UIColor(red: 249.0/255.0, green: 56.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        pageControl4?.orientation = .Horizontal
        view.addSubview(pageControl4!)

        pageControl5.numberOfElements = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

