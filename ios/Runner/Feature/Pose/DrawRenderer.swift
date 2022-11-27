//
//  DrawRenderer.swift
//  MLKitSample
//
//  Created by 吉田周平 on 2022/11/27.
//

import Foundation
import UIKit
import MLKit

class DrawRenderer {
    func draw(uiImage: UIImage, poseList: [Pose]) -> UIImage {
        
        UIGraphicsBeginImageContext(uiImage.size)
        
        uiImage.draw(at: CGPoint.zero)

        let context = UIGraphicsGetCurrentContext()!
        
        let segmentColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        let circleColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let circleBorderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let lineWidth = 2.0
        let circleRadius = 4.0

        for pose in poseList {
            for segment in Segment.allCases {
                let start = pose.landmark(ofType: segment.points.from)
                let end = pose.landmark(ofType: segment.points.to)
                // draw line
                context.setLineWidth(lineWidth)
                context.setStrokeColor(segmentColor.cgColor)
                context.move(to: CGPoint(x: start.position.x, y: start.position.y))
                context.addLine(to: CGPoint(x: end.position.x, y: end.position.y))
                context.strokePath()
                // draw border radius
                context.addArc(center: CGPoint(x: end.position.x, y: end.position.y),
                               radius: circleRadius,
                               startAngle: 0,
                               endAngle: .pi * 2,
                               clockwise: false)
                context.setStrokeColor(circleBorderColor.cgColor)
                context.strokePath()
                // draw circle
                context.addArc(center: CGPoint(x: end.position.x, y: end.position.y),
                               radius: circleRadius,
                               startAngle: 0,
                               endAngle: .pi * 2,
                               clockwise: false)
                context.setFillColor(circleColor.cgColor)
                context.fillPath()
            }
        }
        
        // Save the context as a new UIImage
        let myImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // Return modified image
        return myImage
    }
}
