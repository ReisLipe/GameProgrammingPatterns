//
//  Commands.swift
//  GameProgramingPatterns
//
//  Created by Joao Filipe Reis Justo da Silva on 28/09/25.
//

// MARK: - Command Protocol
protocol Command {
    func execute()
}

// MARK: - Concrete Commands
class JumpCommand: Command {
    func execute() { jump() }
    func jump() { print("Jumping...") }
}

class FireWeaponCommand: Command {
    func execute() { fireWeapon() }
    func fireWeapon() { print("Firing weapon...") }
}

class SwapWeaponCommand: Command {
    func execute() { swapWeapon() }
    func swapWeapon() { print("Swapping weapon...") }
}

class LurchCommand: Command {
    func execute() { lurch() }
    func lurch() { print("Lurching... Au!") }
}

enum CommandName: String, CaseIterable {
    case jump, fire, swap, lurch
    
    func make() -> Command {
        switch self {
        case .jump:  return JumpCommand()
        case .fire:  return FireWeaponCommand()
        case .swap:  return SwapWeaponCommand()
        case .lurch: return LurchCommand()
        }
    }
}
