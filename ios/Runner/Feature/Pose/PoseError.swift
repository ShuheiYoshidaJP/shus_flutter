//
//  PoseError.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation

enum PoseError: Int, NativeError {
    
    case unexpected
    
    var type: FeatureType { return .pose }
    
    var message: String {
        switch self {
        case .unexpected:
            return "unexpected error"
        }
    }
    
    var isSuccess: Bool { return false }
    
    func toDict() -> [String : Any] {
        return [
            "type": type.value,
            "result": isSuccess,
            "code": self.rawValue,
        ]
    }
    
}
