//
//  ShadingView.swift
//  CoreGraphicsDemo
//
//  Created by Kaibo Lu on 2017/2/18.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class ShadingView: UIView {

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
        var numberOfComponents: Int = 1 + colorSpace.numberOfComponents
        let outputRange: [CGFloat] = [1.0, 0.0, 0.0, 1.0,
                                      0.0, 0.0, 0.0, 1.0]
        let cgFunctionEvaluateCallback: CGFunctionEvaluateCallback = { (optionalInfo, input, output) in
            output.initialize(to: 1, count: 8)
        }
        var cgFunctionCallbacks: CGFunctionCallbacks = CGFunctionCallbacks(version: 0,  // just use 0
                                                                           evaluate: cgFunctionEvaluateCallback,
                                                                           releaseInfo: nil) // Optional release callback to release data
        
        let cgFunction: CGFunction = CGFunction(info: &numberOfComponents,
                                                domainDimension: 1, // 1 for Quartz 2D
                                                domain: [0, 1],
                                                rangeDimension: numberOfComponents,
                                                range: outputRange,
                                                callbacks: &cgFunctionCallbacks)!
        
        let axialShading: CGShading = CGShading(axialSpace: colorSpace,
                                                start: CGPoint(x: 10, y: 10),
                                                end: CGPoint(x: bounds.width / 2, y: bounds.height / 2),
                                                function: cgFunction,
                                                extendStart: false,
                                                extendEnd: false)!
        
        context.drawShading(axialShading)
    }

}
