//
//  NativePlugin.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation

class NativePlugin {
    let poseMain = PoseMain()    
    
    func poseDetect(poseInput: PoseInput,
                    detectComleted: @escaping ([String: Any?]) -> () ) {
        let uIImage = poseInput.image?.uIImage
        DispatchQueue.background(input: uIImage) { uIImage -> Result<PoseOutput, PoseError> in
            let result = self.poseMain.detect(uiImage: uIImage)
            return result
        } completion: { result in
            switch result {
            case .success(let output):
                detectComleted(output.toDict())
            case .failure(let error):
                detectComleted(error.toDict())
            }
        }
    }
}
