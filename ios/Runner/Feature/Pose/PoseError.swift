//
//  PoseError.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation

enum PoseError: Int, NativeError {
    
    case detect
    case imageNotFound
    case unexpected
    
    var type: FeatureType { return .pose }
    
    var message: String {
        switch self {
        case .detect:
            return "During detecting pose occured error"
        case .imageNotFound:
            return "UIImage not found"
        case .unexpected:
            return localizedDescription.description
        }
    }
    
    var isSuccess: Bool { return false }
    
    func toDict() -> [String : Any?] {
        return [
            "type": type.value,
            "result": isSuccess,
            "code": self.rawValue,
        ]
    }
    
}
