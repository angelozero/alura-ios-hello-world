# iOs - Swift Básico

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

#### Criando uma table view

 - Para a criacao de uma table view precisamos de pelo menos duas informacoes:
   - A quantirade de linhas
   - O conteudo que vai ser exibido em cada celula
    
 - Para isso contamos com dois metodos "obrigatorios" na criacao da classe
    1 - ```numberOfRowsInSection```
    2 - ```cellForRowAt```

- Sobre **numberOfRowsInSection**
    - retorna a quantidade de celulas que a Table View deve ter, no exemplo usamos o tamanho da lista *refeicoes*
```swift
let refeicoes = ["Pizza", "Macarrao", "Arroz e Feijao"];

//...

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return refeicoes.count
}
```
- Sobre **cellForRowAt**
    - **IndexPath** - Indice aonde os elementos da lista vao estar
```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Criando a celula que vai ser retornada
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil);
        
        // Toda vez que houver uma celula nova antes de renderizar a tela, o index path vai estar exatamente no valor que deve ser renderizado. 
        // No nosso exemplo ele vai passar tres vezes exbiindo "Pizza", "Macarrao" e "Arroz e Feijao"
        let refeicao = refeicoes[indexPath.row]
        
        // Atribuindo o valor da celula com o valor da posicao referente ao indexPath
        celula.textLabel?.text = refeicao
        
        //retornando a celula
        return celula  
    }
```

- A classe fica assim
```swift
class ViewController: UITableViewController {

    
    let refeicoes = ["Pizza", "Macarrao", "Arroz e Feijao"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TableViewController foi carregada com sucesso")
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil);

        let refeicao = refeicoes[indexPath.row]
        
        celula.textLabel?.text = refeicao
        
        return celula  
    }
}
```

---

#### Fazendo telas se comunicarem
 - Na classe ViewController, primeiro criamos uma isntancia da classe RefeicoesTableViewController na classe ViewController

```swift
 class ViewController: UIViewController {
    
    // Declarando uma variavel referente a table view controller de refeicao e deixando ela opcional pois nao sabemos o momento em que ela é instanciada
    var refeicoesTableViewController: RefeicoesTableViewController?
    
    //... some code here
    }
 ```
 ---
 
- Depois para cada refeicao adicionada ( medoto adicionar ) passamos esse objeto para nossa classe RefeicoesTableViewController

```swift
 //Invocando  o metodo de adicionar na lista a nova refeicao informada pelo usuario
 refeicoesTableViewController?.addRefeicao(refeicao)
```
---

- E por fim para acada refeicao adicionada nos finalizamos a tela para voltar para a tela de lista com as refeicoes ( tela inicial da aplicacao )

```swift
// Metodo para retornar a tela anterior executado quando o botao adicionar for clicado
        navigationController?.popViewController(animated: true)
```
---

- A classe ViewController fica assim

```swift
import UIKit

class ViewController: UIViewController {
    
    // Declarando uma variavel referente a table view controller de refeicao e deixando ela opcional pois nao sabemos o momento em que ela é instanciada
    var refeicoesTableViewController: RefeicoesTableViewController?
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("Refeicao: \(refeicao.nome)\nFelicidade: \(refeicao.felicidade)")
        
        
        //Invocando  o metodo de adicionar na lista a nova refeicao informada pelo usuario
        refeicoesTableViewController?.addRefeicao(refeicao)
        
        // Metodo para retornar a tela anterior executado quando o botao adicionar for clicado
        navigationController?.popViewController(animated: true)
    }
}
```

---

- Agora na classe RefeicoesTableViewController sobreescrevemos o metodo prepare for segue, ele é o metodo que intercepta toda vez que o comando "segue" invoca a outra tela

```swift
 // Metodo que é invocado antes do comando "segue", comando que chama a proxima tela
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Aqui acesso a classe da refeicao e inicializo a variavel declarada ---> var refeicoesTableViewController: RefeicoesTableViewController?
        // o if fica da seguinte maneira:
        // se na hora de interceptar a proxima tela, a variavel conseguir ser convertida ( cast ) para UIViewController ( que é o tipo da classe ViewController )
        if let viewController = segue.destination as? ViewController {
            // Entao inicializa
            viewController.refeicoesTableViewController = self
        }
    }
```

---

- Alem disso criamos um metodo para adiconar na lista uma refeicao da qual a classe ViewController vai usar

```swift
    func addRefeicao(_ refeicao: Refeicao){
        refeicoes.append(refeicao);
        
        //Metodo para recarregar a tela
        tableView.reloadData();
    }
```

---

- A classe fica assim RefeicoesTableViewController

```swift
class RefeicoesTableViewController: UITableViewController {
    
    var refeicoes = [Refeicao(nome: "Pizza", felicidade: 4),
                     Refeicao(nome: "Lanche", felicidade: 5),
                     Refeicao(nome: "Salada", felicidade: 2)]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count;
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        celula.textLabel?.text = refeicoes[indexPath.row].nome;
        
        return celula;
        
    }
    
    func addRefeicao(_ refeicao: Refeicao){
        refeicoes.append(refeicao);
        tableView.reloadData();
    }
    
    // Metodo que é invocado antes do comando "segue", comando que chama a proxima tela
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Aqui acesso a classe da refeicao e inicializo a variavel declarada ---> var refeicoesTableViewController: RefeicoesTableViewController?
        // o if fica da seguinte maneira:
        // se na hora de interceptar a proxima tela, a variavel conseguir ser convertida ( cast ) para UIViewController ( que é o tipo da classe ViewController )
        if let viewController = segue.destination as? ViewController {
            // Entao inicializa
            viewController.refeicoesTableViewController = self
        }
    }
}
```
---
#### Entendendo a diferenca de se usar o "_" ou um nome como nome do metodo no parametro do metodo

 - 1 - "_" -> o underline faz com que o nome do parametro nao seja exibido na chamada do metodo, ficando desta maneira
```swift    
    //Usando o _
    func sum(_ n1: Int, _ n2: Int ) -> Int {
        return n1 + n2;
    }
    
    //Sem o _
    func sub(n1: Int, n2: Int) -> Int {
        return n1 - n2;
    }
    
    func exampleMethodUnderscore(){
        let sumResult  = sum(2, 3);
        let subResult = sub(n1: 10, n2: 2)
        
        print("Sum result is \(sumResult)")
        print("Sub result is \(subResult)")
    }
```

 - 2 - usando o nome dentro do parametro
    - Usar o nome dentro do parametro explica tambem alguns metodos que o proprio swift usa
```swift
    // Usando um nome no lugar do _
    func sumOnly(doubleValues n1: Double, n2: Double) -> Double {
        return n1 + n2;
    }
```
 - Para encontrar o metodo sumOny podemos buscar vida CTRL + barra de espaço o nome dele que é double values
   - A leitura do metodo fica mais ou menos assim
   - Sum only double values ou Somando apenas valores do tipo double
   - ```doubleValu ... + CTRL + barra de espaço```
   
```swift
    func exampleMethodNameParameter(){        
        let sumDoubleValuesResult = sumOnly(doubleValues: 2.5, n2: 7.2);
        print("Sum dobule values result is \(sumDoubleValuesResult)")
    }
```
---

#### Diferenca entre if let e guard let

 - No escopo do ```if``` se a variavel for diferente de nula, ela pode ser acessada apenas dentro do escopo do if
 - No escopo do ```guard``` se a variavel for difernte de nula, ela pode ser acessada dentro do escopo do meotoo no qual ela foi declarada

```swift
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Declarando if let a variavel é acessivel apenas dentro do escopo do if
        if let celula = tableView.cellForRow(at: indexPath){
            // celula pode ser usada apenas aqui dentro
        }
        
        // Declarando guard let a variavel pode ser usada dentro do metodo invocado
        guard let celula = tableView.cellForRow(at: indexPath) else {return}
        // celua pode ser usadad dentro de todo o metodo didSelectRowAt
        
    }
```
