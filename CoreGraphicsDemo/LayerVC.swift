//
//  LayerVC.swift
//  CoreGraphicsDemo
//
//  Created by Kaibo Lu on 2017/2/21.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class LayerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Layer"
        view.backgroundColor = .groupTableViewBackground
        
        let layerView: LayerView = LayerView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 300))
        layerView.backgroundColor = .white
        view.addSubview(layerView)
    }

}
