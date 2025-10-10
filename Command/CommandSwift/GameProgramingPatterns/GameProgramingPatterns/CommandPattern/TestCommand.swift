//
//  TestCommand.swift
//  GameProgramingPatterns
//
//  Created by Joao Filipe Reis Justo da Silva on 10/10/25.
//

func test_command_pattern() {
    let title: String = "This is an example for Command Pattern"
    let info: String = "Press X, Y, A or B to get a result. Press any other key to exit."
    let buttonChange: String = "If you want to chang the action for a button, type 'change'"

    print(title)
    print(info)
    print(buttonChange)
    
    var gameLoop: Bool = true
    while(gameLoop) {
        let input: String = readLine()?.lowercased() ?? ""
        switch input {
        case "x": InputHandler.shared.handleInpput(pressed: Button.X)
        case "y": InputHandler.shared.handleInpput(pressed: Button.Y)
        case "a": InputHandler.shared.handleInpput(pressed: Button.A)
        case "b": InputHandler.shared.handleInpput(pressed: Button.B)
        case "change": change_button()
        default: gameLoop = false
        }
    }
}

private func change_button() {
    let buttonChangeInfo: String = "Remap: type the button to change (X, Y, A, B) or 'cancel' to go back"
    print(buttonChangeInfo)
    
    guard let btnStr = readLine(), btnStr.lowercased() != "cancel" else { print("Remapeamento cancelado."); return }
    guard let button = Button(from: btnStr) else { print("Botão inválido. Use X, Y, A ou B."); return }
    
    let options = CommandName.allCases.map(\.rawValue).joined(separator: ", ")
    print("Escolha o novo comando para \(button.label): \(options)")
    guard let cmdStr = readLine()?.lowercased(), let name = CommandName(rawValue: cmdStr) else {
        print("Comando inválido. Opções: \(options)")
        return
    }
    
    InputHandler.shared.changeConfig(of: button, to: name.make())
    print("Feito: \(button.label) agora executa \(name.rawValue).")
}
