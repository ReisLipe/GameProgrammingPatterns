import Foundation

let title: String = "This is an example for Command Pattern"
let info: String = "Press X, Y, A or B to get a result. Press any other key to exit."
print(title)
print(info)

var gameLoop: Bool = true
while(gameLoop) {
    let input: String = readLine()?.lowercased() ?? ""
    switch input {
    case "x": InputHandler.shared.handleInpput(pressed: Button.X)
    case "y": InputHandler.shared.handleInpput(pressed: Button.Y)
    case "a": InputHandler.shared.handleInpput(pressed: Button.A)
    case "b": InputHandler.shared.handleInpput(pressed: Button.B)
    default: gameLoop = false
    }
}