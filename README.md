# DiarioApp

O aplicativo Diário possui o objetivo de servir como um refúgio aos seus usuários, de modo que possam escrever tudo que passa pelas suas mentes de maneira segura e acolhedora. O app possui uma interface simplificada, a fim de que todos possam utilizá-lo com facilidade.

Ao entrar no aplicativo, é exibida uma tela com "Meus Diários", onde todos os diários criados pelo usuário aparecem, assim, podendo existir diversos diários para diferentes contextos (Faculdade, Trabalho, etc). Para adicionar um novo, basta clicar no ícone + que aparece no primeiro card na tela inicial e adicionar um nome a ele no PopUp que surge assim que o ícone é clicado. Para escrever em um dos diários, o usuário deve clicar no card desejado e acessar a TextField, digitar o que deseja e apertar o botão de Enviar, com o obejtivo de servir como um diário, as mensagens escritas ficam agrupadas por dia.

Algumas das funcionalidades do aplicativo incluem o uso de Animations, em que, ao criar um novo diário, a imagem dentro do card balança horizontalmente para chamar a atenção do usuário, mostrando que ele foi criado. Outra funcionalidade é o uso da Apple Intelligence para gerar tags a partir do que foi escrito, ou seja, o modelo irá analisar os textos e descreverá os principais tópicos contidos no mesmo. Além do uso de Extensions, que apesar de não serem uma funcionalidade, facilitam muito a construção e a organização do código desenvolvido.

## Interface
-> Tela Inicial

<img width="301" height="655" alt="Simulator Screenshot - iPhone 17 Pro - 2025-12-05 at 11 10 38" src="https://github.com/user-attachments/assets/8dcce953-b6ac-40d6-b0a6-fb62f86ed5f0" />


-> Criação de um novo Diário

<img width="301" height="655" alt="Simulator Screenshot - iPhone 17 Pro - 2025-12-05 at 11 11 08" src="https://github.com/user-attachments/assets/e018ba9c-5b87-4f3a-9936-55427df74132" />
<img width="301" height="655" alt="Simulator Screenshot - iPhone 17 Pro - 2025-12-05 at 11 11 16" src="https://github.com/user-attachments/assets/0a515762-e4e3-45ba-94cb-b9583732f61c" />
<img width="301" height="655" alt="Simulator Screenshot - iPhone 17 Pro - 2025-12-05 at 11 13 12" src="https://github.com/user-attachments/assets/3b97fcf8-0c4e-4477-b14f-2f45434b4be6" />


-> Anotações e uso da Apple Intelligence

<img width="301" height="655" alt="Simulator Screenshot - iPhone 17 Pro - 2025-12-05 at 11 12 46" src="https://github.com/user-attachments/assets/d2e9207a-a874-4b8c-84b1-32cc08668e70" />

## Dispositivos Suportados
Por se tratar de um app com o uso de Apple Intelligence, ele só é compatível com modelos de iPhone 15 Pro e superioes, já que os anterioes não possuem o sistema de inteligência necessário. Além dos dispositivos estarem na versão iOS 26, para que todas as funcionalidades funcionem de maneira correta.

## Organização de pastas e arquivos
Para uma melhor organização no código, foram criadas diversas pastas:

Diario -> pasta do projeto inteiro, onde ficam todos os arquivos e pastas;

Diario.xcodeproj -> arquivo que o Xcode usa para abrir o projeto;

Diario -> agrupamento do código desenvolvido;

Extensions -> arquivos que adicionam funcionalidades extras (ShakeEffect.swift - efeito de balançar ao card)

Models -> modelos das informações do app, onde é definido como é um diário e a sua entrada, o modelo de tags e as regras para salvar as informações do diário;

ViewModels -> onde tudo é arrumado antes de aparecer na tela (DiarioDetailViewModel.swift -> controla os dados da tela de detalhes do diário; TagGenerator.swift -> cria ou sugere tags automaticamente para as entradas do diário, onde fica o prompt);

Views -> a parte visual do app (CartaoDiario.swift -> o cartão que mostra um diário na lista; ListaDiariosView.swift -> a tela com todos os diários; DiarioDetailView.swift -> a tela que mostra um diário aberto; BotaoAdicionarDiario.swift -> o botão de criar novo diário);

Diario.entitlements -> diz ao iOS quais permissões o app usa, como o uso da Apple Intelligence;

DiarioApp.swift -> é o arquivo principal do aplicativo.
