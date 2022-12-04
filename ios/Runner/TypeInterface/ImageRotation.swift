//
//  ImageRotation.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation

enum ImageRotation: Double {
    case rotate0 = 0.0
    case rotate90 = 90.0
    case rotate180 = 180.0
    case rotate270 = 270.0

    func toRad() -> Double {
        return rawValue * Double.pi / 180.0
    }
    
    static func fromOrientation(orientation: UIImage.Orientation) -> Self {
        switch orientation {
        case .up:
            return .rotate0
        case .down:
            return .rotate180
        case .left:
            return .rotate90
        case .right:
            return .rotate270
        case .upMirrored:
            return .rotate0
        case .downMirrored:
            return .rotate180
        case .leftMirrored:
            return .rotate90
        case .rightMirrored:
            return .rotate270
        @unknown default:
            fatalError()
        }
    }
}
