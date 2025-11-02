//
//  TestFlyweight.swift
//  GameProgramingPatterns
//
//  Created by Joao Filipe Reis Justo da Silva on 02/11/25.
//

import Foundation

func testFlyweightPattern() {
    let numObjects = 100_000
    let title: String = "This is an example for Flyweight Pattern"
    let info: String = "We will create \(numObjects) objects in a `Heavyweight` way and `Flyweight` way"
    
    print(title)
    print(info)
    
    let bundle = Bundle.main
    print("Bundle:", bundle.bundlePath)
    let allPngs = bundle.paths(forResourcesOfType: "png", inDirectory: nil)
    print("PNG files in bundle (\(allPngs.count)):", allPngs.joined(separator: "\n"))
    
    let heavyweightDuration = buildHeavyweightObjects(numObjects)
    let flywieghtDuration   = buildFlyweightObjects(numObjects)
    
    let heavyweightInfo  = "Heavyweight took \(heavyweightDuration) seconds"
    let flywieghtInfo    = "Flyweight took \(flywieghtDuration) seconds"
    
    print(heavyweightInfo)
    print(flywieghtInfo)
}

private func buildHeavyweightObjects(_ numObjects: Int) -> TimeInterval {
    let startInfo = "Building `Heavyweight` objects"
    print(startInfo)
    
    let start = Date()
    
    for _ in 0..<numObjects {
        /// The Common Objects are instantiated **numObjects times**!
        let treeBarkTexture = Texture(file: "DwarfFortressLogo.png")!
        let treeLeavesTexture = Texture(file: "MTGLogo.png")!
        
        let position = CGPoint(x: CGFloat.random(in: 0..<1000), y: CGFloat.random(in: 0..<1000))
        let thickness: CGFloat = CGFloat.random(in: 0..<100)
        let size: CGSize = CGSize(width: CGFloat.random(in: 0..<100), height: CGFloat.random(in: 0..<100))

        let _ = HeavyweightTree(
            bark: treeBarkTexture,
            leaves: treeLeavesTexture,
            position: position,
            thickness: thickness,
            size: size
        )
    }
    
    let end = Date()
    let duration = end.timeIntervalSince(start)
    return duration
}

private func buildFlyweightObjects(_ numObjects: Int) -> TimeInterval{
    let startInfo = "Building `Flyweight` objects"
    print(startInfo)
    
    let start = Date()
    
    /// The Common Objects are instantiated just **ONCE**!
    let treeBarkTexture = Texture(file: "DwarfFortressLogo.png")!
    let treeLeavesTexture = Texture(file: "MTGLogo.png")!
    let commonObjects = TreeModel(bark: treeBarkTexture, leaves: treeLeavesTexture)
    
    for _ in 0..<numObjects {
        let position = CGPoint(x: CGFloat.random(in: 0..<1000), y: CGFloat.random(in: 0..<1000))
        let thickness: CGFloat = CGFloat.random(in: 0..<100)
        let size: CGSize = CGSize(width: CGFloat.random(in: 0..<100), height: CGFloat.random(in: 0..<100))

        let _ = FlyweightTree(
            treeModel: commonObjects,
            position: position,
            thickness: thickness,
            size: size
        )
    }
    
    let end = Date()
    let duration = end.timeIntervalSince(start)
    return duration
}
