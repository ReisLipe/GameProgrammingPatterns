// MARK: - Command Protocol
// I still need to implement the decoupling
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