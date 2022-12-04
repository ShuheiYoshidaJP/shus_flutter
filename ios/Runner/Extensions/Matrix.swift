//
//  Matrix.swift
//  Runner
//
//  Created by 吉田周平 on 2022/11/30.
//

import Foundation

class Matrix {
    private static let init3x1: [CGFloat] = [0.0,0.0,0.0]
    static func calc3x1(matrix3x3: [[CGFloat]], matrix3x1: [CGFloat]) -> [CGFloat] {
        var result = init3x1
        for i in 0..<3 {
            for j in 0..<3 {
                result[i] += matrix3x3[i][j] * matrix3x1[j]
            }
        }
        return result
    }
    
}
