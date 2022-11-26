//
//  NativeRusultBase.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation
protocol NativeRusultBase {
    var isSuccess: Bool { get }
    func toDict() -> [String: Any]
}
