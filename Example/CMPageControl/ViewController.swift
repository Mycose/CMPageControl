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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let image = UIImage(named: "icon-star.png")
        let selectedImage = UIImage(named: "icon-star-blue.png")

        //self.pageControl = CMPageControl(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height-40-20, width: 200, height: 40))
        self.pageControl = CMPageControl(frame: CGRect(x: 0, y: 40, width: 40, height: 200))
        self.pageControl?.numberOfElements = 5
        self.pageControl?.elementImage = image
        self.pageControl?.elementSelectedImage = selectedImage
        self.pageControl?.elementBackgroundColor = UIColor.clear
        self.pageControl?.elementWidth = 20.0
        self.pageControl?.elementBorderWidth = 0.0
        self.pageControl?.elementSelectedBorderWidth = 0.0
        self.pageControl?.elementSelectedBackgroundColor = UIColor.clear
        self.pageControl?.orientation = .Vertical
        self.view.addSubview(self.pageControl!)

        self.pageControl1 = CMPageControl(frame: CGRect(x: 40, y: 40, width: 300, height: 40))
        self.pageControl1?.numberOfElements = 8
        self.pageControl1?.elementBackgroundColor = UIColor(red: 8.0/255.0, green: 103.0/255.0, blue: 146.0/255.0, alpha: 1.0)
        self.pageControl1?.elementWidth = 16.0
        self.pageControl1?.elementBorderWidth = 0.0
        self.pageControl1?.elementSelectedBorderWidth = 0.0
        self.pageControl1?.elementSelectedBackgroundColor = UIColor(red: 47.0/255.0, green: 143.0/255.0, blue: 176.0/255.0, alpha: 1.0)
        self.pageControl1?.orientation = .Horizontal
        self.view.addSubview(self.pageControl1!)

        self.pageControl2 = CMPageControl(frame: CGRect(x: 60, y: 160, width: 250, height: 50))
        self.pageControl2?.numberOfElements = 7
        self.pageControl2?.elementBackgroundColor = UIColor.darkGray
        self.pageControl2?.elementWidth = 20.0
        self.pageControl2?.elementBorderWidth = 0.0
        self.pageControl2?.elementSelectedBorderWidth = 1.0
        self.pageControl2?.elementSelectedBackgroundColor = UIColor.gray
        self.pageControl2?.elementSelectedBorderColor = UIColor.white
        self.pageControl2?.orientation = .Horizontal
        self.view.addSubview(self.pageControl2!)

        self.pageControl3 = CMPageControl(frame: CGRect(x: 0, y: 300, width: 40, height: 300))
        self.pageControl3?.numberOfElements = 7
        self.pageControl3?.elementBackgroundColor = UIColor.clear
        self.pageControl3?.elementBorderColor = UIColor.gray
        self.pageControl3?.elementWidth = 10.0
        self.pageControl3?.isRounded = false
        self.pageControl3?.elementBorderWidth = 1.0
        self.pageControl3?.elementSelectedBorderWidth = 1.0
        self.pageControl3?.elementSelectedBackgroundColor = UIColor.clear
        self.pageControl3?.elementSelectedBorderColor = UIColor.white
        self.pageControl3?.orientation = .Vertical
        self.view.addSubview(self.pageControl3!)

        self.pageControl4 = CMPageControl(frame: CGRect(x: 60, y: 400, width: 300, height: 40))
        self.pageControl4?.numberOfElements = 7
        self.pageControl4?.elementBackgroundColor = UIColor(red: 206.0/255.0, green: 0.0, blue: 86.0/255.0, alpha: 1.0)
        self.pageControl4?.elementWidth = 30
        self.pageControl4?.isRounded = false
        self.pageControl4?.elementBorderWidth = 0.0
        self.pageControl4?.elementSelectedBorderWidth = 0.0
        self.pageControl4?.elementSelectedBackgroundColor = UIColor(red: 249.0/255.0, green: 56.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        self.pageControl4?.orientation = .Horizontal
        self.view.addSubview(self.pageControl4!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

