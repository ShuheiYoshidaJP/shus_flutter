//
//  PoseOutput.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation

struct PoseOutput: NativeOutput {
    var type: FeatureType = .pose
    
    var isSuccess: Bool { return true }
    
    func toDict() -> [String : Any] {
        return [
            "type": type.value,
            "result": isSuccess,
        ]
    }
    
    
}
