//
//  DispatchQueue+Background.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/29.
//

import Foundation
extension DispatchQueue {

    static func background<T, R>(delay: Double = 0.0,
                                 input: T,
                                 background: @escaping (T) -> R,
                                 completion: @escaping (R) -> Void) {
        DispatchQueue.global(qos: .background).async {
            
            let backgroundResult = background(input)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                completion(backgroundResult)
            })
        }
    }

}
