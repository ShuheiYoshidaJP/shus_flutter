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
        
        
        let currentImageSize = uiImage.size
        let originalImageSize: CGSize = {
            switch uiImage.imageOrientation {
            case .up:
                return uiImage.size
            case .down:
                return uiImage.size
            case .left:
                return CGSize(width: uiImage.size.height, height: uiImage.size.width)
            case .right:
                return CGSize(width: uiImage.size.height, height: uiImage.size.width)
            case .upMirrored:
                return uiImage.size
            case .downMirrored:
                return uiImage.size
            case .leftMirrored:
                return CGSize(width: uiImage.size.height, height: uiImage.size.width)
            case .rightMirrored:
                return CGSize(width: uiImage.size.height, height: uiImage.size.width)
            @unknown default:
                return uiImage.size
            }
        }()
        
        UIGraphicsBeginImageContext(currentImageSize)
        // ↓これいる？
        uiImage.draw(at: CGPoint.zero)
        // ↑これいる？
        
        let context = UIGraphicsGetCurrentContext()!
        
        let segmentColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        let circleColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let circleBorderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let lineWidth = 10.0
        let circleRadius = 16.0

        for pose in poseList {
            for segment in Segment.allCases {
                let start = pose.landmark(ofType: segment.points.from)
                let startPoint = CGPoint(x: start.position.x, y: start.position.y)
                let startAffine = startPoint.affine(inputSize: currentImageSize, ouputSize: originalImageSize, rad: .pi / 2.0)
                let end = pose.landmark(ofType: segment.points.to)
                let endPoint = CGPoint(x: end.position.x, y: end.position.y)
                let endAffine = endPoint.affine(inputSize: currentImageSize, ouputSize: originalImageSize, rad: .pi / 2.0)
                
                drawLine(context: context,
                         lineWidth: lineWidth,
                         start: startAffine,
                         end: endAffine,
                         color: segmentColor.cgColor)
                
                drawCircle(context: context,
                           center: startAffine,
                           radius: circleRadius,
                           color: circleBorderColor.cgColor)
                
                fillCircle(context: context,
                           center: startAffine,
                           radius: circleRadius,
                           color: circleColor.cgColor)
                
                drawCircle(context: context,
                           center: endAffine,
                           radius: circleRadius,
                           color: circleBorderColor.cgColor)
                
                fillCircle(context: context,
                           center: endAffine,
                           radius: circleRadius,
                           color: circleColor.cgColor)
            }
        }
        
        let myImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return myImage
    }
    
    private func drawLine(context: CGContext,
                          lineWidth: CGFloat,
                          start: CGPoint,
                          end: CGPoint,
                          color: CGColor) {
        context.setLineWidth(lineWidth)
        context.setStrokeColor(color)
        context.move(to: start)
        context.addLine(to: end)
        context.strokePath()
    }
        
    private func drawCircle(context: CGContext,
                            center: CGPoint,
                            radius: CGFloat,
                            color: CGColor) {
        context.addArc(center: center,
                       radius: radius,
                       startAngle: 0,
                       endAngle: .pi * 2,
                       clockwise: false)
        context.setStrokeColor(color)
        context.strokePath()
    }
    
    private func fillCircle(context: CGContext,
                            center: CGPoint,
                            radius: CGFloat,
                            color: CGColor) {
        context.addArc(center: center,
                       radius: radius,
                       startAngle: 0,
                       endAngle: .pi * 2,
                       clockwise: false)
        context.setFillColor(color)
        context.fillPath()
    }
}
