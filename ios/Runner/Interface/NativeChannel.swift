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
                guard let args = call.arguments as? [String: Any] else {
                    return
                }
                self.plugin.poseDetect(args: args)
            default:
                result(FlutterMethodNotImplemented)
                return
            }
        })
    }
    
    func setCompletionHandler() {
        plugin.completePose = { poseResult in
            let args = poseResult.toDict()
            self.channel.invokeMethod("pose-nf", arguments: args)
        }
    }
}
