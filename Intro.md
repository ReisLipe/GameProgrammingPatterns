# Gaming Programing Patterns - Robert Nystrom
Livro escrito por Robert Nystrom sobre desenvolvimento de jogos e mais
especificamente sobre os padrões de projeto aplicados ao código desses jogos.


# Sobre o Livro:
O livro segue o modelo "Crowd Publishing", ou seja foi editoriado pelo próprio
público e é completamente. O livro pode ser lido por completo no website de
Nystrom seguindo o link: [https://gameprogrammingpatterns.com/contents.html]

> About halfway through writing, I decided to forgo a traditional publisher. I
> knew that meant losing the guidance an editor brings, but I had email from
> dozens of readers telling me where they wanted the book to go. I’d lose
> proofreaders, but I had over 250 bug reports to help improve the prose.

Nystrom baseou seu livro no famoso *Design Patterns: Elements of Reusable Object-Oriented Software* 
escrito pela Gangue dos Quatro (Erich Gamma, Richard Helm, Ralph Johnson e John
Vlissides). Segundo o autor, o objetivo do livro não é superar o que foi escrito
pela gangue, mas sim aumentar a gama do que já foi dito e adicionar um enfoque
no desenvolvimento de jogos.

> I could just as well have called this book More Design Patterns, but I think
> games make for more engaging examples. Do you really want to read yet another
> book about employee records and bank accounts?

A obra está dividida em três seções, a primeira introduz o livro e explica sua
razão de ser, a segunda revisita uma série de padrões da Gangue dos Quatro e a
última é uma seleção de padrões que foram julgadas úteis no decorrer da vida
profisional do autor.


# Arquitetura Performance e Jogos
Para ajudar na compreensão do livro, esse trecho é a abordagem do autor sobre o
que seria uma boa arquitetura, como manipulá-la e como aplicá-la a jogos.

1. O que é uma boa arquitetura?
Uma boa arquitura pode ser resumida em uma frase: "quando faço uma mudança,
parece que todo o código foi construído em antecipação a ela". Ou seja, o fator
crucial para julgar uma boa arquitetura é *o quão fácil ela é capaz de suportar mudanças.*
2. Como fazer uma mudança?
O primeiro passo para fazer uma mudança, argumenta o autor, é entender como e o
que o código existente está fazendo. Essa etapa é geralmente ignorada, porém
tende a ser a que mais consome tempo no processo de produção de código.

# O Belo no Código Feio
Óbviamente o intuito deste livro é fazer o desenvolvedor escrever código do
"jeito certo", porém Nystrom argumenta que existe beleza em um código
descuidado. Escrever código com uma arquitetura elegante e robosta leva tempo e
esforço, mas em alguns momentos tudo que o profissional deseja é velocidade e
praticidade. Imagine o processo de prototipação de uma nova mecânica, é
necessário que isso seja feito em matéria de dias, portanto passar tempo
trabalhando em algo indireto, não pode ocorrer. É necessário que o programdor e
os cargos de liderança entendam que o que está sendo escrito é uma prototipação,
que caso venha a se tornar uma ferramente real, levará tempo e esforço.

Portanto temos 3 forças que precisamos balancear:
1. Queremos uma boa arquitetura para que o código seja fácil de entender durante
   a vida útil do projeto.
2. Queros que o programa seja rápido.
3. Nos queremos que as tarefas de hoje sejam completadas rapidamente.

# Simplicidade
A forma mais fácil de combinar as três forças anteriores é manter um código
simples.

# Dicas:
- Abstraction and decoupling make evolving your program faster and easier, but
  don’t waste time doing them unless you’re confident the  code in question
  needs that flexibility.
- Think about and design for performance throughout your development cycle, but
  put off the low-level, nitty-gritty optimizations that lock assumptions into
  your code until as late as possible.  
- Move quickly to explore your game’s design space, but don’t go so fast that
  you leave a mess behind you. You’ll have to live with it, after all.
- If you are going to ditch code, don’t waste time making it pretty. Rock stars
  trash hotel rooms because they know they’re going to check out the next day. 

But, most of all, if you want to make something fun, have fun making it.




