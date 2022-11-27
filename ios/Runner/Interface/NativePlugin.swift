//
//  NativePlugin.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation

class NativePlugin {
    let poseMain = PoseMain()
    
    var completePose: ((NativeRusultBase) -> Void)?
    
    func poseDetect(poseInput: PoseInput) -> [String: Any?] {
        let uiImage = poseInput.image?.toUIImage()
        let result = poseMain.detect(uiImage: uiImage)
        switch result {
        case .success(let output):
            return output.toDict()
        case .failure(let error):
            return error.toDict()
        }
    }
}
