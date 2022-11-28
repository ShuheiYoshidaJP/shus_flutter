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
    
    func detect(uiImage: UIImage?) -> Result<PoseOutput, PoseError> {
        guard let uiImage = uiImage else { return .failure(.imageNotFound) }
        let poseResult = poseBase.detect(uiImage: uiImage)
        switch poseResult {
        case .success(let poseList):
            let renderedImage: UIImage = renderer.draw(uiImage: uiImage, poseList: poseList)
            let flutterImage = FlutterImage(uIImage: renderedImage)
            let poseInterface = PoseInterface(poseList: poseList)
            let poseData = PoseData(image: flutterImage, pose: poseInterface)
            let poseOutput = PoseOutput(poseData: poseData)
            return .success(poseOutput)
        case .failure(let error):
            return .failure(error)
        }
        
    }
}
