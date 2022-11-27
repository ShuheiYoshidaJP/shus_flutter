//
//  Segments.swift
//  MLKitSample
//
//  Created by 吉田周平 on 2022/11/27.
//

import Foundation
import MLKit

enum Segment: CaseIterable {
    case ears
    case shoulders
    case hips
    case leftEarNose
    case leftShoulderElbow
    case leftElbowWrist
    case leftShoulderHip
    case leftHipKnee
    case leftKneeAnkle
    case rightEarNose
    case rightShoulderElbow
    case rightElbowWrist
    case rightShoulderHip
    case rightHipKnee
    case rightKneeAnkle
    
    var points: (from: PoseLandmarkType, to: PoseLandmarkType) {
        switch self {
        case .ears:
            return (PoseLandmarkType.leftEar, PoseLandmarkType.rightEar)
        case .shoulders:
            return (PoseLandmarkType.leftShoulder, PoseLandmarkType.rightShoulder)
        case .hips:
            return (PoseLandmarkType.leftHip, PoseLandmarkType.rightHip)
        case .leftEarNose:
            return (PoseLandmarkType.leftEar, PoseLandmarkType.nose)
        case .leftShoulderElbow:
            return (PoseLandmarkType.leftShoulder, PoseLandmarkType.leftElbow)
        case .leftElbowWrist:
            return (PoseLandmarkType.leftElbow, PoseLandmarkType.leftWrist)
        case .leftShoulderHip:
            return (PoseLandmarkType.leftShoulder, PoseLandmarkType.leftHip)
        case .leftHipKnee:
            return (PoseLandmarkType.leftHip, PoseLandmarkType.leftKnee)
        case .leftKneeAnkle:
            return (PoseLandmarkType.leftKnee, PoseLandmarkType.leftAnkle)
        case .rightEarNose:
            return (PoseLandmarkType.rightEar, PoseLandmarkType.nose)
        case .rightShoulderElbow:
            return (PoseLandmarkType.rightShoulder, PoseLandmarkType.rightElbow)
        case .rightElbowWrist:
            return (PoseLandmarkType.rightElbow, PoseLandmarkType.rightWrist)
        case .rightShoulderHip:
            return (PoseLandmarkType.rightShoulder, PoseLandmarkType.rightHip)
        case .rightHipKnee:
            return (PoseLandmarkType.rightHip, PoseLandmarkType.rightKnee)
        case .rightKneeAnkle:
            return (PoseLandmarkType.rightKnee, PoseLandmarkType.rightAnkle)
        }
    }
    
}
