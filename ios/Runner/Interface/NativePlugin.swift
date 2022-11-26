//
//  NativePlugin.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation

class NativePlugin {
    var completePose: ((NativeRusultBase) -> Void)?
    func poseDetect(args: [String: Any]) {}
}
