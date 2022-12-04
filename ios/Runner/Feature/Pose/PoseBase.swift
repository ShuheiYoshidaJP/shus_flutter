//
//  PoseBase.swift
//  MLKitSample
//
//  Created by 吉田周平 on 2022/11/27.
//

import Foundation
import MLImage
import MLKit

class PoseBase {
    var poseDetector: PoseDetector
    
    init() {
        let options = AccuratePoseDetectorOptions()
        poseDetector = PoseDetector.poseDetector(options: options)
    }
    
    func detect(uiImage: UIImage) -> Result<[Pose], PoseError> {
        let visionImage = VisionImage(image: uiImage)
        visionImage.orientation = uiImage.imageOrientation
        do {
            let poseList: [Pose] = try poseDetector.results(in: visionImage)
            return .success(poseList)
        } catch {
            return.failure(.detect)
        }
    }
}
