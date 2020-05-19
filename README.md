# iOs - Swift Básico
---
- Declarando variáveis

```swift
var nome: String = "Angelo"
var isOn: Bool = false
let cores: [String] = ["Amarelo", "Vermelho", "Verde", "Azul"]
let valores: [Double] = [10.2, 3, 50, 75.7]
```

---

- Interpolação em Swift, nada mais é que passar a variável dentro das aspas usando ```\(variavel)```
```swift
print("Nome do animal \(nome)")
```
 
 ---

- Diferença entre **let** e **var**
    - **let** - É uma constante, uma variável que nunca muda seu valor.
    - **var** - É uma variável normal com dados variáveis.
---

- Looping em swift
```swift
let cores: [String] = ["Amarelo", "Vermelho", "Verde", "Azul"]

for i in 0...1 {
    print("\(i) \(cores[i])")
}

for i in 0...cores.count-1 {
    print("\(i) \(cores[i])")
}

for cor in cores {
    print(cor)
}
```
---
#### Criando funções em swift
 - uma simples função
```swift
    func funcaoTeste(){
        print("Invocando funcao teste")
    }
```
- uma função com parâmetros
```swift
    func funcaoTesteComParametro(nome:String, idade:Int){
        print("\nInvocando funcao com parametros")
        print("Nome: \(nome)")
        print("Idade: \(idade)")
    }
```

 -  uma função com parâmetros ocultando o nome dos parâmetros na chamada desta função, o caracter "*underline ( _ isDog )*" faz com que o nome do atributo não apareça

```swift
    func funcaoComParametrosOcultandoNomeDoParametro(_ nome: String, _ isDog: Bool){
        print("\nInvocando funcao com parametros sem chama-la informando o nome do parametro")
        print("Nome do animal \(nome)")
        print("É um cachorro? \(isDog)")
    }
```
 - função exibindo os nomes dos parâmetros uma função que não exibe
```swift
    // diferenca entre uma funcao que exibe os nomes e que nao exibe
    funcaoTesteComParametro(nome: "Lucia", idade:79)
    funcaoComParametrosOcultandoNomeDoParametro("Jake", true)
```

- uma função recebendo uma lista no parâmetro
```swift
    func funcaoRecebendoListaNoParametro(_ cores: [String]){
        print("Exibindo cores da lista recebida por parametro")
            for cor in cores {
            print("\(cor)")
        }
    }
```
 - uma função que calcula valores dentro de uma lista e retorna o total
    
```swift
    func funcaoQueCalculaValoresDentroDaLista(_ valores: Array<Double>) -> Double {
        print("\nSomando todos os valores da lista \(valores)")
        var total: Double = 0;
            for valor in valores {
            total += valor
        }
        return total;
    }
    
    // ao receber esta funcao
    let valorTotal:Double = funcaoQueCalculaValoresDentroDaLista(valores)
```
---
#### Classes
 - Criando uma classe
```swift
class Refeicao {
    // O sinal "?" indica que a variavel nao e um item obrigatorio a ser preenchido
    var nome: String? 
    var felicidade: String?
}
```
---
- Criando uma classe com construtor
```swift
class Refeicao {
    
    var refeicao: String
    var felicidade: String
    var itens : Array<Item>
    
    init(refeicao: String, felicidade: String, itens: Array<Item>) {
        self.refeicao = refeicao
        self.felicidade = felicidade
        self.itens = itens
    }
}
```
---
- Usando **if**, **let** e **guard let**
```swift
func verificaNomeRefeicao(_ refeicao: Refeicao){
    if (refeicao.nome != nil){
        print("Refeicao:  \(refeicao.nome)")
    } else {
        print("Refeicao sem nome\n")
    }

    refeicao.nome = "Pizza"
    
    if let nomeRefeicao: String = refeicao.nome {
        print("Nome da refeicao: \(nomeRefeicao)")
    } else {
        print("Refeicao sem nome\n")
    }

    guard let nomeRefeicao: String = refeicao.nome else { return }

    print("Nome da refeicao atualizada: \(nomeRefeicao)\n")
}
```
---
