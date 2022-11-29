//
//  CGPoint+Rotate.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/29.
//

import Foundation

extension CGPoint {
    // アフィン変換
    func affine(inputSize: CGSize, ouputSize: CGSize, rad: Double) -> CGPoint {
        let angle = Float(rad)
        let cos: CGFloat = CGFloat(cos(angle))
        let sin: CGFloat = CGFloat(sin(angle))
        let x: CGFloat = (self.x - inputSize.width / 2.0) * cos - (self.y - inputSize.height / 2.0) * sin + ouputSize.width / 2.0
        let y: CGFloat = (self.x - inputSize.width / 2.0) * sin + (self.y - inputSize.height / 2.0) * cos + ouputSize.height / 2.0
        return CGPoint(x: x, y: y)
    }
}
