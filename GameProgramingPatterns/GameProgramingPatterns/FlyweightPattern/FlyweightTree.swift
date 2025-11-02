//
//  FlyweightTree.swift
//  GameProgramingPatterns
//
//  Created by Joao Filipe Reis Justo da Silva on 31/10/25.
//

import Foundation

/// This are the Common-Stuff of a Tree, since every tree has
/// the same texture for the bark and leaves
class TreeModel {
    let bark: Texture
    let leaves: Texture
    
    init(bark: Texture, leaves: Texture) {
        self.bark = bark
        self.leaves = leaves
    }
}

class FlyweightTree {
    let treeModel: TreeModel
    
    let position: CGPoint
    let thickness: CGFloat
    let size: CGSize
    
    init(treeModel: TreeModel, position: CGPoint, thickness: CGFloat, size: CGSize) {
        self.treeModel = treeModel
        self.position = position
        self.thickness = thickness
        self.size = size
    }
}
