//
//  FlutterImage.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation
import Flutter
import UIKit

struct FlutterImage: InterfaceBase {
    var imageData: Data?
    var rotate: ImageRotation = .rotate0
    var width: Double = 0.0
    var height: Double = 0.0
    
    private var flutterStandardTypedData: FlutterStandardTypedData? {
        if let imageData = imageData {
            return FlutterStandardTypedData(bytes: imageData)
        } else {
            return nil
        }
    }
    
    init(args: [String: Any]) {
        let byteData = args["byteData"] as! FlutterStandardTypedData?
        imageData = byteData?.data
    }
    
    init(from uIImage: UIImage) {
        rotate = ImageRotation.fromOrientation(orientation: uIImage.imageOrientation)
        imageData = uIImage.pngData()
    }
    
    func toUIImage() -> UIImage? {
        guard let imageData = imageData else { return nil }
        return UIImage(data: imageData)!
    }
    
    func toDict() -> [String : Any?] {
        return [
            "rotate": rotate.rawValue,
            "width": width,
            "height": height,
            "data": flutterStandardTypedData,
        ]
    }
}
