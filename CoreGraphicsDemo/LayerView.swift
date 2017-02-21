//
//  LayerView.swift
//  CoreGraphicsDemo
//
//  Created by Kaibo Lu on 2017/2/21.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class LayerView: UIView {

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let layer: CGLayer = CGLayer(context, size: CGSize(width: 20, height: 20), auxiliaryInfo: nil)!
        let layerContext: CGContext = layer.context!
        
        layerContext.setFillColor(UIColor.orange.cgColor)
        layerContext.fill(CGRect(x: 0, y: 0, width: 20, height: 5))
        
        layerContext.setStrokeColor(UIColor.blue.cgColor)
        layerContext.move(to: CGPoint(x: 0, y: 10))
        layerContext.addCurve(to: CGPoint(x: 20, y: 10),
                              control1: CGPoint(x: 5, y: 0),
                              control2: CGPoint(x: 15, y: 20))
        layerContext.strokePath()
        
        for i in 0..<10 {
            for j in i..<10 {
                context.draw(layer, at: CGPoint(x: 25 * i, y: 25 * j))
            }
        }
    }

}
