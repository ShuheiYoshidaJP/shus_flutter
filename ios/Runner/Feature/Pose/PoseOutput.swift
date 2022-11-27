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
    
    var poseData: PoseData
    
    init(poseData: PoseData) {
        self.poseData = poseData
    }
    
    func toDict() -> [String : Any?] {
        return [
            "type": type.value,
            "result": isSuccess,
            "value": poseData.toDict(),
        ]
    }
}

struct PoseData: InterfaceBase {
    
    var image: FlutterImage
    var pose: PoseInterface
    
    func toDict() -> [String : Any?] {
        return [
            "image": image.toDict(),
            "pose": pose.toDict(),
        ]
    }
}
