//
//  PoseInput.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/27.
//

import Foundation

struct PoseInput {
    
    var image: FlutterImage?
    
    var height: Double?
    
    init(args: Any?) {
        
        guard let unWrappedArgs = args as? [String : Any] else { return }
        
        if let imageArgs = unWrappedArgs["image"] as? [String : Any] {
            image = FlutterImage(args: imageArgs)
        }
        
        if let height = unWrappedArgs["height"] as? Double {
            self.height = height
        }
    }
}
