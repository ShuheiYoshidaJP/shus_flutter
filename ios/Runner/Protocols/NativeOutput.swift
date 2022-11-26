//
//  NativeOutput.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/26.
//

import Foundation

protocol NativeOutput: NativeRusultBase {
    var type: FeatureType { get set }
}
