enum Button {
    case X, Y, A, B
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
    
    func changeConfg(of button: Button, to command: Command) {
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