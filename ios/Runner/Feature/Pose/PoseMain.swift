//
//  PoseMain.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation
import MLImage
import MLKit

class PoseMain {
    var poseBase: PoseBase
    var renderer: DrawRenderer
    
    init() {
        poseBase = PoseBase()
        renderer = DrawRenderer()
    }
    
    func detect(uiImage: UIImage?,
                completedDetection: @escaping (Result<PoseOutput, PoseError>) -> ()) {
        guard let uiImage = uiImage else { return completedDetection(.failure(.imageNotFound)) }
        
        DispatchQueue.background(input: uiImage) { uIImage -> Result<[Pose], PoseError> in
            let poseResult = self.poseBase.detect(uiImage: uiImage)
            return poseResult
        } completion: { result in
            switch result {
            case .success(let poseList):
                let renderedImage = self.renderer.draw(uiImage: uiImage, poseList: poseList)
                let flutterImage = FlutterImage(uIImage: renderedImage)
                let poseInterface = PoseInterface(poseList: poseList)
                let poseOutput = PoseOutput(image: flutterImage, pose: poseInterface)
                completedDetection(.success(poseOutput))
            case .failure(let error):
                completedDetection(.failure(error))
            }
        }
    }
}
