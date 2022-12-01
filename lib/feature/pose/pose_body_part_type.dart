enum PoseBodyPartType {
  leftHeel,
  rightEyeInner,
  leftToe,
  nose,
  rightEye,
  rightHip,
  rightElbow,
  leftEyeInner,
  leftAnkle,
  leftEar,
  leftPinkyFinger,
  rightWrist,
  leftEye,
  rightAnkle,
  rightEar,
  rightThumb,
  rightToe,
  leftEyeOuter,
  rightPinkyFinger,
  leftShoulder,
  leftElbow,
  leftIndexFinger,
  leftKnee,
  rightEyeOuter,
  mouthleft,
  leftWrist,
  mouthright,
  rightIndexFinger,
  rightKnee,
  leftThumb,
  leftHip,
  rightHeel,
  rightShoulder;

  String get responseKey {
    switch (this) {
      case PoseBodyPartType.leftHeel:
        return 'LeftHeel';
      case PoseBodyPartType.rightEyeInner:
        return 'RightEyeInner';
      case PoseBodyPartType.leftToe:
        return 'LeftToe';
      case PoseBodyPartType.nose:
        return 'Nose';
      case PoseBodyPartType.rightEye:
        return 'RightEye';
      case PoseBodyPartType.rightHip:
        return 'RightHip';
      case PoseBodyPartType.rightElbow:
        return 'RightElbow';
      case PoseBodyPartType.leftEyeInner:
        return 'LeftEyeInner';
      case PoseBodyPartType.leftAnkle:
        return 'LeftAnkle';
      case PoseBodyPartType.leftEar:
        return 'LeftEar';
      case PoseBodyPartType.leftPinkyFinger:
        return 'LeftPinkyFinger';
      case PoseBodyPartType.rightWrist:
        return 'RightWrist';
      case PoseBodyPartType.leftEye:
        return 'LeftEye';
      case PoseBodyPartType.rightAnkle:
        return 'RightAnkle';
      case PoseBodyPartType.rightEar:
        return 'RightEar';
      case PoseBodyPartType.rightThumb:
        return 'RightThumb';
      case PoseBodyPartType.rightToe:
        return 'RightToe';
      case PoseBodyPartType.leftEyeOuter:
        return 'LeftEyeOuter';
      case PoseBodyPartType.rightPinkyFinger:
        return 'RightPinkyFinger';
      case PoseBodyPartType.leftShoulder:
        return 'LeftShoulder';
      case PoseBodyPartType.leftElbow:
        return 'LeftElbow';
      case PoseBodyPartType.leftIndexFinger:
        return 'LeftIndexFinger';
      case PoseBodyPartType.leftKnee:
        return 'LeftKnee';
      case PoseBodyPartType.rightEyeOuter:
        return 'RightEyeOuter';
      case PoseBodyPartType.mouthleft:
        return 'MouthLeft';
      case PoseBodyPartType.leftWrist:
        return 'LeftWrist';
      case PoseBodyPartType.mouthright:
        return 'MouthRight';
      case PoseBodyPartType.rightIndexFinger:
        return 'RightIndexFinger';
      case PoseBodyPartType.rightKnee:
        return 'RightKnee';
      case PoseBodyPartType.leftThumb:
        return 'LeftThumb';
      case PoseBodyPartType.leftHip:
        return 'LeftHip';
      case PoseBodyPartType.rightHeel:
        return 'RightHeel';
      case PoseBodyPartType.rightShoulder:
        return 'RightShoulder';
    }
  }
}
