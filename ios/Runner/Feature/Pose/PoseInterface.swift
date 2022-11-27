//
//  PoseInterface.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/27.
//

import Foundation
import MLKit

struct PoseInterface: InterfaceBase {
    var poseData: [PoseLandmarkType: Point3D]
    
    init(poseList: [Pose]) {
        poseData = [:]
        if (poseList.count >= 1) {
            let pose = poseList[0]
            for landmark in pose.landmarks {
                let point3d = Point3D(point: landmark.position)
                poseData.updateValue(point3d, forKey: landmark.type)
            }
        }
    }
    
    func toDict() -> [String : Any?] {
        var result: [String : Any?] = [:]
        for (landmarkType, p3d) in poseData {
            result.updateValue(p3d.toDict(), forKey: landmarkType.rawValue)
        }
        return result
    }
}

struct Point3D: InterfaceBase {
    
    var x: Double
    var y: Double
    var z: Double
    
    init(point: Vision3DPoint) {
        x = point.x
        y = point.y
        z = point.z
    }
    
    func toDict() -> [String : Any?] {
        return [
            "x": self.x,
            "y": self.y,
            "z": self.z,
        ]
    }
}
