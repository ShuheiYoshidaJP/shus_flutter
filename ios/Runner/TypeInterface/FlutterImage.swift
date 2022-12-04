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
    var uIImage: UIImage?
    var rotate: ImageRotation = .rotate0
    var width: Double = 0.0
    var height: Double = 0.0
    var fileType: FileType?
    
    enum FileType {
        case file(String?)
        case bytes(FlutterStandardTypedData?)
    }
    
    private var flutterStandardTypedData: FlutterStandardTypedData? {
        guard let uIImage = uIImage,
              let imageData = uIImage.pngData() else { return nil }
        return FlutterStandardTypedData(bytes: imageData)
    }
    
    init(args: [String: Any]) {
        let fileTypeStr = args["fileType"] as? String
        self.fileType = {
            switch fileTypeStr {
            case "file":
                return FileType.file(args["path"] as? String)
            case "bytes":
                return FileType.bytes(args["content"] as? FlutterStandardTypedData)
            default:
                return nil
            }
        }()
        self.uIImage = {
            switch fileType {
            case .file(let path):
                guard let path = path else { return nil }
                return UIImage(contentsOfFile: path)
            case .bytes(let flutterData):
                guard let flutterData = flutterData else { return nil }
                return UIImage(data: flutterData.data)
            case .none:
                return nil
            }
        }()
    }
    
    init(uIImage: UIImage) {
        self.uIImage = uIImage
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
