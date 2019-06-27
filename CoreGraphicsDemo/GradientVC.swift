//
//  GradientVC.swift
//  CoreGraphicsDemo
//
//  Created by Kaibo Lu on 2017/2/17.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class GradientVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Gradient"
        view.backgroundColor = .groupTableViewBackground
        
        let gradientView: GradientView = GradientView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 300))
        gradientView.backgroundColor = .white
        view.addSubview(gradientView)
    }

}
