# ZUP_OBJC
Mobile Challenge

Pré-requisitos:
* MacOS
* Xcode

————————————————————————————————————————————————————————————————————————————————————

Passo 01: Instalação do gerenciador de dependências - Carthage

O Download pode ser realizado no seguinte endereço Web:
https://github.com/Carthage/Carthage/releases


————————————————————————————————————————————————————————————————————————————————————

Passo 02: Atualizar as dependências do projeto

Navegar até a pasta do projeto e executar os seguintes comandos:
carthage update --platform iOS


————————————————————————————————————————————————————————————————————————————————————

Passo 03: Verificar as dependências com Link no projeto

Abrir o projeto, clicar no Target, e em Linked Frameworks and Libraries verificar se as
dependências estão corretamente setadas.

————————————————————————————————————————————————————————————————————————————————————

Passo 04: Build e Project Run

Ao final basta escolher um simulador e dar um Run no projeto.
Verificar ainda se não há restrições no Proxy.

————————————————————————————————————————————————————————————————————————————————————


Dependências utilizadas:
* AFNetworking
* JsonModel