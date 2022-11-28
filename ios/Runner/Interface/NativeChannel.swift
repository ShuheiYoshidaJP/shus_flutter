//
//  NativeChannel.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation
import Flutter

class NativeChannel {
    
    let channel: FlutterMethodChannel
    let plugin: NativePlugin
    
    init(messenger: FlutterBinaryMessenger) {
        channel = FlutterMethodChannel(name: "native-plugin", binaryMessenger: messenger)
        plugin = NativePlugin()
    }
    
    func setCallHandler() {
        channel.setMethodCallHandler ({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch call.method {
            case "pose-fn":
                let input = PoseInput(args: call.arguments)
                self.plugin.poseDetect(poseInput: input,
                                       detectComleted: { resultData in
                    result(resultData)
                })
            default:
                result(FlutterMethodNotImplemented)
                return
            }
        })
    }
}
