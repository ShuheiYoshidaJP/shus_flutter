//
//  CGPoint+Rotate.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/29.
//

import Foundation

extension CGPoint {
    // アフィン変換
    // https://imagingsolution.net/imaging/affine-transformation/
    func affine(uiImage: UIImage) -> CGPoint {
        let size = uiImage.size
        let convert: (rotation: CGFloat, displacement: CGPoint) = {
            switch uiImage.imageOrientation {
            case .up:
                return (0.0, CGPoint(x: 0.0, y: 0.0))
            case .down:
                return (.pi/2.0, CGPoint(x: size.width, y: -size.height))
            case .left:
                return (-.pi/2.0, CGPoint(x: 0.0, y: -size.height))
            case .right:
                return (.pi/2.0, CGPoint(x: size.width, y: 0.0))
            case .upMirrored:
                return (0.0, CGPoint(x: 0.0, y: 0.0))
            case .downMirrored:
                return (0.0, CGPoint(x: 0.0, y: 0.0))
            case .leftMirrored:
                return (0.0, CGPoint(x: 0.0, y: 0.0))
            case .rightMirrored:
                return (0.0, CGPoint(x: 0.0, y: 0.0))
            @unknown default:
                return (0.0, CGPoint(x: 0.0, y: 0.0))
            }
        }()
        let initPoint = CGPoint(x: self.x, y: self.y)
        let rotated = initPoint.rotate(rad: convert.rotation)
        let moved = rotated.move(displacement: convert.displacement)
        return moved
    }
    
    func rotate(rad: CGFloat) -> CGPoint {
        let matrix3x3 = [[cos(rad), -sin(rad), 0.0], [sin(rad), cos(rad), 0.0], [0.0, 0.0, 1.0]]
        let result = Matrix.calc3x1(matrix3x3: matrix3x3, matrix3x1: [self.x, self.y, 1.0])
        return CGPoint(x: result[0], y: result[1])
    }
    
    func move(displacement: CGPoint) -> CGPoint {
        let matrix3x3 = [[1.0, 0.0, displacement.x], [0.0, 1.0, displacement.y], [0.0, 0.0, 1.0]]
        let result = Matrix.calc3x1(matrix3x3: matrix3x3, matrix3x1: [self.x, self.y, 1.0])
        return CGPoint(x: result[0], y: result[1])
    }
}
