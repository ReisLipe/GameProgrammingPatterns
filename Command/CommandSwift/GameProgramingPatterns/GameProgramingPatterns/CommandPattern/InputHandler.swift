//
//  InputHandler.swift
//  GameProgramingPatterns
//
//  Created by Joao Filipe Reis Justo da Silva on 28/09/25.
//

enum Button: String, CaseIterable {
    case X, Y, A, B
    
    init?(from input: String) {
        switch input.lowercased() {
        case "x": self = .X
        case "y": self = .Y
        case "a": self = .A
        case "b": self = .B
        default: return nil
        }
    }
    
    var label: String { rawValue }
}

class InputHandler {
    static var shared = InputHandler()
    
    private var buttonX: Command?
    private var buttonY: Command?
    private var buttonA: Command?
    private var buttonB: Command?
    
    init() {
        self.setStandardButtonConfig()
    }
    
    func handleInpput(pressed: Button) {
        switch pressed {
        case .X: buttonX?.execute()
        case .Y: buttonY?.execute()
        case .A: buttonA?.execute()
        case .B: buttonB?.execute()
        }
    }
    
    func changeConfig(of button: Button, to command: Command) {
        switch button {
        case .X: buttonX = command
        case .Y: buttonY = command
        case .A: buttonA = command
        case .B: buttonB = command
        }
    }
        
    private func setStandardButtonConfig() {
        buttonX = JumpCommand() as Command
        buttonY = FireWeaponCommand() as Command
        buttonA = SwapWeaponCommand() as Command
        buttonB = LurchCommand() as Command
    }
}
