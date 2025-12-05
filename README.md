# DiarioApp

O aplicativo Diário possui o objetivo de servir como um refúgio aos seus usuários, de modo que possam escrever tudo que passa pelas suas mentes de maneira segura e acolhedora. O app possui uma interface simplificada, a fim de que todos possam utilizá-lo com facilidade.

Ao entrar no aplicativo, é exibida uma tela com "Meus Diários", onde todos os diários criados pelo usuário aparecem, assim, podendo existir diversos diários para diferentes contextos (Faculdade, Trabalho, etc). Para adicionar um novo, basta clicar no ícone + que aparece no primeiro card na tela inicial e adicionar um nome a ele no PopUp que surge assim que o ícone é clicado. Para escrever em um dos diários, o usuário deve clicar no card desejado e acessar a TextField, digitar o que deseja e apertar o botão de Enviar, com o obejtivo de servir como um diário, as mensagens escritas ficam agrupadas por dia.

Algumas das funcionalidades do aplicativo incluem o uso de Animations, em que, ao criar um novo diário, a imagem dentro do card balança horizontalmente para chamar a atenção do usuário, mostrando que ele foi criado. Outra funcionalidade é o uso da Apple Intelligence para gerar tags a partir do que foi escrito, ou seja, o modelo irá analisar os textos e descreverá os principais tópicos contidos no mesmo. Além do uso de Extensions, que apesar de não serem uma funcionalidade, facilitam muito a construção e a organização do código desenvolvido.

## Desenvolvimento
### Extensions
Foram utilizadas extensions durante todo o código para facilitar o desenvolvimento do app, já que essas estruturas podem ser reutilizadas, mantendo uma organização e eficiência maior ao código.
```swift
extension Color {
    static let fundoDiario = Color(.systemGray6)
    static let sombraDiario = Color(.systemGray3)
}
```
```swift
extension View {
    func estiloCartaoDiario() -> some View {
        self
            .padding()
            .frame(maxWidth: .infinity, minHeight: 150)
            .background(Color.fundoDiario)
            .cornerRadius(16)
            .shadow(color: .sombraDiario.opacity(0.4), radius: 4, x: 0, y: 2)
    }
}

```
```swift
enum EstiloTipografia {
    case h1, h2, h3, corpo
}

extension View {
    func tipografia(_ estilo: EstiloTipografia) -> some View {
        switch estilo {
        case .h1:
            return self.font(.system(size: 32, weight: .bold))
        case .h2:
            return self.font(.system(size: 24, weight: .semibold))
        case .h3:
            return self.font(.system(size: 18, weight: .medium))
        case .corpo:
            return self.font(.system(size: 16))
        }
    }
}
```
```swift
extension Date {
    func apenasDia() -> Date {
        Calendar.current.startOfDay(for: self)
    }
}
```
