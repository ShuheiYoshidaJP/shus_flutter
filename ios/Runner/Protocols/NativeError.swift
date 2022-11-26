//
//  NativeError.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation

protocol NativeError: NativeRusultBase, Error {
    var type: FeatureType { get }
    var message: String { get }
}
