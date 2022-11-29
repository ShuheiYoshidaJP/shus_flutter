//
//  PoseOutput.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation
import MLKit

struct PoseOutput: NativeOutput {
    var type: FeatureType = .pose
    
    var isSuccess: Bool { return true }
    
    var image: FlutterImage
    var pose: PoseInterface
    
    init(image: FlutterImage, pose: PoseInterface) {
        self.image = image
        self.pose = pose
    }
    
    func toDict() -> [String : Any?] {
        return [
            "type": type.value,
            "result": isSuccess,
            "value": [
                "image": image.toDict(),
                "pose": pose.toDict(),
            ],
        ]
    }
}
