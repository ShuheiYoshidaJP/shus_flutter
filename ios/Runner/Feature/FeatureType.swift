//
//  FeatureType.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation

enum FeatureType {
    case pose
    case other
    
    var value: String {
        switch self {
        case .pose:
            return "pose"
        case .other:
            return "other"
        }
    }
}
