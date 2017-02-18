//
//  ShadingVC.swift
//  CoreGraphicsDemo
//
//  Created by Kaibo Lu on 2017/2/18.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class ShadingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Shading"
        view.backgroundColor = .groupTableViewBackground
        
        let gradientView: ShadingView = ShadingView(frame: CGRect(x: 0, y: 64, width: view.bounds.width, height: 300))
        gradientView.backgroundColor = .white
        view.addSubview(gradientView)
    }

}
