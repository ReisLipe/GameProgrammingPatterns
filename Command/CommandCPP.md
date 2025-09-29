# Padrão Command
### Problema Inicial
Em muitos jogos, entradas do jogador (como apertar botões) disparam ações
específicas. Um código simples poderia ser algo assim:
``` cpp
void InputHandler::handleInpput() {
    if (isPressed(Button_X)) jump();    
    else if (isPressed(Button_Y)) fireGun();
    else if (isPressed(Button_A)) swapWeapon();
    else if (isPressed(Button_B)) lurchIneffectively();
}
```
Esse código funciona, mas tem um problema: ele assume que cada botão está fixo a
uma função. Se o jogador quiser remapear os botões, teremos que mexer
diretamente no código. O padrão Command resolve isso adicionando uma camada de
abstração: em vez de chamar a função diretamente, associamos cada botão a um
objeto comando, responsável por executar a ação. 

### Command
Primeiro definimos a interface de Comando. Todos os comandos implmentar o que
está descrito aqui.
``` cpp
class Command {
    public:
        virtual ~Command() {}
        virtual void execute() = 0;
};
```

Então criamos os comandos concretos, perceba que eles implmenetam exatamente o
que foi definido na interface Command:
``` cpp
class JumpCommand : public Command {
    public:
        virtual void execute() { jump(); }
};

class FireCommand : public Command {
    public:
        virtual void execute() { fireGun(); }
};
// ...
```

Na classe InputHandler, guardamos um ponteiro para um comando em cada botão:
```cpp
class InputHandler {
    public:
        void handleInput() {
            if (isPressed(BUTTON_X)) buttonX_->execute();
            else if (isPressed(BUTTON_Y)) buttonY_->execute();
            else if (isPressed(BUTTON_A)) buttonA_->execute();
            else if (isPressed(BUTTON_B)) buttonB_->execute();
        }

    // Methods to bind commands...

    private:
        Command* buttonX_;
        Command* buttonY_;
        Command* buttonA_;
        Command* buttonB_;
};
``` 
O padrão Command cria uma camada abstração entre a função de ação e o botão,
isso nos permite trocar o comportamento de qualquer botão apenas alterando o
comando associado, sem precisar mexer no código do `InputHandler`.

### Melhorando o Padrão
O código que criamos anteriormente já é bem útil, mas ainda existe um problema.
Ele assume que as funções de ação (`fireGun()`, `jump()` etc.) ou as classes de
comando têm informações suficiente sobre os personagens para fazê-los executar
estes movimentos. Por exemplo: `jump()` ou `JumpCommand` tem informações para
distinguir qual personagem pulará e sua posição no mapa. Se esses trechos
realmente tivessem esse tipo de informação, estariamos enfrentando um problema
de acoplamento e limitaria a reutilização dessas funções modificações futuros no
nosso código.

Para garantir que as funções de ação e as classes de comando estão desacopladas
do personagem alvo, podemos passá-lo como parâmetro. Observe o código abaixo:
``` cpp
class Command {
    public:
        virtual ~Command() {}
        virtual void execute(GameActor& character) = 0;
}
```
Perceba que agora é necessário passar o personagem alvo que executará a ação.
Implenentando essas mudanças nas classes concretas temos:
``` cpp
class JumpCommand {
    public:
        virtual void execute(GameActor& character) {
            character.jump();
        }
}

class FireGunCommand {
    public:
        virtual void execute(GameActor& character) {
            character.fireGun();
        }
}

// Continua o código
```
E podemos alterar a função `handleInput()` para atuar da seguinte forma:
```cpp
Command* InputHandler::handleInput() {
    if (isPressed(Button_X)) return buttonX_;
    if (isPressed(Button_Y)) return buttonY_;
    if (isPressed(Button_A)) return buttonA_;
    if (isPressed(Button_B)) return buttonB_;

    // se nada for pressionado:
    return NULL;
}

Command* command = inputHandler.handleInput();
if (command) command->execute(character);
```
Perceba que com essas mudanças não apenas enfrentamos o problema do acoplamento,
mas também possibilitamos que qualquer personagem que seja criado para o jogo
possa executar comandos. Ou seja, criamos uma estrutura capaz de suportar não
apenas as entradas do jogador para seu personagem, mas também entradas do
jogador para qualquer outro personagem. Agora é possível até mesmo que uma
inteligência artificial envie comandos para os personagens, possibilitando que
seja implementado um sistema de bots etc.

Aliás, se tornássemos esses comandos serializados, poderiamos enviar correntes
de comandos através da rede e tornar possível que as entradas de um jogador
possam navegar pela internet até uma outra máquina e serem executadas  por um
personagem. Ou seja, possibilita uma exepriência multiplayer.


