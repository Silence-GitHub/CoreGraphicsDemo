//
//  LinearGradientView.swift
//  CoreGraphicsDemo
//
//  Created by Kaibo Lu on 2017/2/17.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class GradientView: UIView {

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let colorComponents: [CGFloat] = [1.0, 0.5, 0.4, 1.0,
                                          0.8, 0.8, 0.3, 1.0,
                                          0.0, 0.0, 0.0, 1.0]
        let locations: [CGFloat] = [0.0, 0.8, 1.0]
        let gradient: CGGradient = CGGradient(colorSpace: colorSpace,
                                              colorComponents: colorComponents,
                                              locations: locations,
                                              count: locations.count)!
        context.drawLinearGradient(gradient,
                                   start: CGPoint(x: 10, y: 10),
                                   end: CGPoint(x: bounds.width / 2, y: bounds.height / 2),
                                   options: CGGradientDrawingOptions(rawValue: 0))
        
        context.drawRadialGradient(gradient,
                                   startCenter: CGPoint(x: bounds.width / 2 + 50, y: bounds.height / 2 + 50),
                                   startRadius: 30,
                                   endCenter: CGPoint(x: bounds.width * 3 / 4, y: bounds.height * 3 / 4),
                                   endRadius: 20,
                                   options: CGGradientDrawingOptions(rawValue: 0))
    }

}
