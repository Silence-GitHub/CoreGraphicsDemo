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
        let outputRange: [CGFloat] = [0.0, 1.0, // Red
                                      0.0, 1.0, // Green
                                      0.0, 1.0, // Blue
                                      0.0, 1.0] // Alpha
        let cgFunctionEvaluateCallback: CGFunctionEvaluateCallback = { (optionalInfo, input, output) in
            let targetValues: [CGFloat] = [1.0 * input.pointee, // Red
                                           0.0 * input.pointee, // Green
                                           0.5 * input.pointee, // Blue
                                           1.0] // Alpha
            output.initialize(from: targetValues)
        }
        
        // Create CGFunctionCallbacks
        // @param version: Just use 0
        // @param evaluate: CGFunctionEvaluateCallback
        // @param releaseInfo: Optional release callback to release data
        var cgFunctionCallbacks: CGFunctionCallbacks = CGFunctionCallbacks(version: 0,
                                                                           evaluate: cgFunctionEvaluateCallback,
                                                                           releaseInfo: nil)
        
        // Create CGFunction
        // @param domainDimension: Input dimension. Use 1 for Quartz 2D
        // @param domain: Input values. Recommennd to use [0, 1], means from start to end of the gradient
        // @param rangeDimension: Output dimension. Colors space components + 1 (alpha component)
        // @param range: Output values. Recommend to use [0, 1, 0, 1, ...], which count = rangeDimension * 2. Each [0, 1] represents start and end value of a color space component
        let cgFunction: CGFunction = CGFunction(info: &numberOfComponents,
                                                domainDimension: 1,
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
        
        // Right bottom
        let cgFunctionEvaluateCallback2: CGFunctionEvaluateCallback = { (optionalInfo, input, output) in
            let frequency: [CGFloat] = [5, 22, 11, 0]
            var targetValues: [CGFloat] = []
            for i in 0..<3 {
                let value: CGFloat = (1 + sin(input.pointee * frequency[i])) / 2
                targetValues.append(value)
            }
            targetValues.append(1)
            output.initialize(from: targetValues)
        }
        var cgFunctionCallbacks2: CGFunctionCallbacks = CGFunctionCallbacks(version: 0,
                                                                            evaluate: cgFunctionEvaluateCallback2,
                                                                            releaseInfo: nil)
        let cgFunction2: CGFunction = CGFunction(info: &numberOfComponents,
                                                 domainDimension: 1,
                                                 domain: [0, 1],
                                                 rangeDimension: numberOfComponents,
                                                 range: outputRange,
                                                 callbacks: &cgFunctionCallbacks2)!
        let radialShading: CGShading = CGShading(radialSpace: colorSpace,
                                                 start: CGPoint(x: bounds.width / 2 + 50, y: bounds.height / 2 + 50),
                                                 startRadius: 30,
                                                 end: CGPoint(x: bounds.width * 3 / 4, y: bounds.height * 3 / 4),
                                                 endRadius: 20,
                                                 function: cgFunction2,
                                                 extendStart: false,
                                                 extendEnd: false)!
        context.drawShading(radialShading)
    }

}
