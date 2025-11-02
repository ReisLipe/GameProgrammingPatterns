//
//  HeavyweightTree.swift
//  GameProgramingPatterns
//
//  Created by Joao Filipe Reis Justo da Silva on 02/11/25.
//

import Foundation

class HeavyweightTree {
    let bark: Texture
    let leaves: Texture
    let position: CGPoint
    let thickness: CGFloat
    let size: CGSize
    
    init(bark: Texture, leaves: Texture, position: CGPoint, thickness: CGFloat, size: CGSize) {
        self.bark = bark
        self.leaves = leaves
        self.position = position
        self.thickness = thickness
        self.size = size
    }
}
