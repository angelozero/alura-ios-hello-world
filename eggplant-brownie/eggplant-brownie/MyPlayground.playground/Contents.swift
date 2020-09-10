import UIKit

//https://cursos.alura.com.br/course/swift-desenvolvimento-ios/task/53341

var nome: String = "Angelo"
var nomeFinal: String = "Ferreira"
var idade: Int = 29
var peso: Double = 65.5
var isOn: Bool = false
let cores: [String] = ["Amarelo", "Vermelho", "Verde", "Azul"]
let valores: [Double] = [10.2, 3, 50, 75.7]

/*
 Diferença entre "let" e "var
 let: uma constante. Uma variável que nunca muda seu valor.
 var: uma variável normal com dados variáveis.
 */


for i in 0...1 {
    print("\(i) \(cores[i])")
}

print("")

for i in 0...cores.count-1 {
    print("\(i) \(cores[i])")
}

print("")

for cor in cores {
    print(cor)
}

print("")

func funcaoTeste(){
    print("Invocando funcao teste")
}

func funcaoTesteComParametro(nome:String, idade:Int){
    print("\nInvocando funcao com parametros")
    print("Nome: \(nome)")
    print("Idade: \(idade)")
}

func funcaoComParametrosOcultandoNomeDoParametro(_ nome: String, _ isDog: Bool){
    print("\nInvocando funcao com parametros sem chama-la informando o nome do parametro")
    print("Nome do animal \(nome)")
    print("É um cachorro? \(isDog)")
}

func funcaoRecebendoListaNoParametro(_ cores: [String]){
    print("\nExibindo cores da lista recebida por parametro")
    for cor in cores {
        print("\(cor)")
    }
}

func funcaoQueCalculaValoresDentroDaLista(_ valores: Array<Double>) -> Double {
    print("\nSomando todos os valores da lista \(valores)")
    var total: Double = 0;
    for valor in valores {
        total += valor
    }
    return total;
}

print("Nome:            \(nome)")
print("Sobrenome:       \(nomeFinal)")
print("Idade:           \(idade)")
print("Peso:            \(peso)")
print("Verdaderio ?:    \(isOn)")
print("")

funcaoTeste()
funcaoTesteComParametro(nome: "Lucia", idade:79)
funcaoComParametrosOcultandoNomeDoParametro("Jake", true)
funcaoRecebendoListaNoParametro(["Preto", "Branco", "Cinza"])
let valorTotal:Double = funcaoQueCalculaValoresDentroDaLista(valores)
print("Valor total: \(valorTotal)\n")

/* --------------------------------------------------------------------- */

// Criando uma classe
class Refeicao {
    var nome: String?
    var felicidade: String?
}

class Item {
    var nome: String
    var tipo: String
    
    init(nome: String, tipo: String) {
        self.nome = nome
        self.tipo = tipo
    }
}

// Criando uma classe com construtor
class RefeicaoComConstrutor {
    
    var refeicao: String
    var felicidade: String
    var itens : Array<Item>
    
    init(refeicao: String, felicidade: String, itens: Array<Item>) {
        self.refeicao = refeicao
        self.felicidade = felicidade
        self.itens = itens
    }
}

let item1: Item = Item(nome: "Arroz", tipo: "Grao")
let item2: Item = Item(nome: "Feijao", tipo: "Grao")
let item3: Item = Item(nome: "Banana", tipo: "Fruta")

var itens: Array<Item> = Array<Item>()
itens.append(item1)
itens.append(item2)
itens.append(item3)

var refeicaoCriada: Refeicao = Refeicao()
var refeicaoComConstrutor : RefeicaoComConstrutor = RefeicaoComConstrutor(refeicao: "X-Burguer", felicidade: "5", itens: itens)
print("Nome da refeicao da classe com construtor: \(refeicaoComConstrutor.refeicao)\n")


func verificaNomeRefeicao(_ refeicao: Refeicao){
    if (refeicao.nome != nil){
        print("Refeicao:  \(refeicao.nome)")
    } else {
        print("Refeicao sem nome\n")
    }
    
    refeicao.nome = "Pizza"
    
    // Usando if let e guard let
    
    if let nomeRefeicao: String = refeicao.nome {
        print("Nome da refeicao: \(nomeRefeicao)")
    } else {
        print("Refeicao sem nome\n")
    }
    
    guard let nomeRefeicao: String = refeicao.nome else {
        return
    }
    
    print("Nome da refeicao atualizada: \(nomeRefeicao)\n")
}


verificaNomeRefeicao(refeicaoCriada)

for item in refeicaoComConstrutor.itens {
    print("Nome: \(item.nome) Tipo: \(item.tipo)")
}

print("")
