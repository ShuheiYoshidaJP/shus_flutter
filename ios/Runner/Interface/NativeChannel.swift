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
                guard let args = call.arguments as? [String: Any] else { return }
                let input = PoseInput(args: call.arguments)
                let data = self.plugin.poseDetect(args: args)
                result(data)
            default:
                result(FlutterMethodNotImplemented)
                return
            }
        })
    }
}
