//
//  Texture.swift
//  GameProgramingPatterns
//
//  Created by Joao Filipe Reis Justo da Silva on 02/11/25.
//

import ImageIO
import Foundation
import CoreGraphics

class Texture {
    // Cost comes from reading a file and decoding to RGBA8 pixels.
    let width: Int
    let height: Int
    
    init?(file: String) {
        let here = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
        let url  = here.appendingPathComponent(file)
        
        print(url)
        
        // Load file bytes (I/O)
        guard let data = try? Data(contentsOf: url),
              let src = CGImageSourceCreateWithData(data as CFData, nil),
              let cg = CGImageSourceCreateImageAtIndex(src, 0, nil) else { return nil }
        
        self.width = cg.width
        self.height = cg.height
    }
}
