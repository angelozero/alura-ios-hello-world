# iOs - Swift Básico


#### Atalhos XCode

 - Auto Fix
   - *control + alt + command + f*
   
 - Usando Mark ( escrever MARK em maiusculo )
    - ```// MARK : descricao````

- Identar
   - control + i

- Deletar linha ( com o curso no comeco da linha )
    - control + k

- Duas abas
 - command + control + t

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

---

#### Criando um botao programaticamente, deixando ele ao lado direto no topo e invocando o metodo correto

 - Primeiro invocamos o metodo ```viewDidLoad()``` ele sera executado assim que a tela for carregada
 - Entendendo os itens agora de um ```UIBarButtonItem```
    - title ---> titulo que o botao ira receber
    - style ---> estilo que o botao vai ter quando for pressionado ( parte visual )
    - target ---> diz aonde o metodo esta ( em qual classe ele se encontra Ex.: " target: ClasseComMetodo.metodo" )
    - action ---> açao que sera invoacada quando o botao for pressionado
    - #selector(self.adicionarItem) ---> em vez de usar uma string para informar o nome do metodo a ser invocado, usamos exatamente a chamada dele atraves da classe
    
```swift
    
    // Metodo que sera executado assim que a tela for carregada
    override func viewDidLoad() {
        // Entendendo melhor o UIBarButtonItem
        // title ---> titulo que o botao ira receber
        // style ---> estilo que o botao vai ter quando for pressionado ( parte visual )
        // target ---> diz aonde o metodo esta ( em qual classe ele se encontra Ex.: " target: ClasseComMetodo.metodo" )
        // action ---> açao que sera invoacada quando o botao for pressionado
        // #selector(self.adicionarItem) ---> em vez de usar uma string para informar o nome do metodo a ser invocado, usamos exatamente a chamada dele atraves da classe
        
        let botaoAdiconaItem = UIBarButtonItem(title: "adiciona item", style: .plain, target: self, action: #selector(self.adicionarItem))
        
        navigationItem.rightBarButtonItem = botaoAdiconaItem
    }
    
    @objc func adicionarItem(){
        print("item adicionado")
    }
```

---

#### Usando a função gesture e longpress

 - Funcao que é invocada quando o usuario pressiona por um determinado tempo x a tela do aplicativo em algum lugar.
 
 ```swift
     // Metodo que preenche cada celula com o nome da refeicao
    // Usando gesture e longpress
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        celula.textLabel?.text = refeicoes[indexPath.row].nome;
        
        // primeiro criamos um gestureRecognizer
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhesDaRefeicao(_:)))
        
        // adicionamos o evento a celula
        celula.addGestureRecognizer(longPress)
        
        return celula;
        
    }
    
    @objc func mostrarDetalhesDaRefeicao(_ gesture: UILongPressGestureRecognizer){
        
        if(gesture.state == UIGestureRecognizer.State.began){
            
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            
            let refeicao = refeicoes[indexPath.row]
            
            print(refeicao)
           
        }
    }
 ```

---

#### Utilizando alertas com UIAlertController com botao para fechar o alerta

```swift
    @objc func mostrarDetalhesDaRefeicao(_ gesture: UILongPressGestureRecognizer){
        
        if(gesture.state == UIGestureRecognizer.State.began){
            
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            
            let refeicao = refeicoes[indexPath.row]
            
            print(refeicao)
            
            let alerta = UIAlertController(title: refeicao.nome, message: "\(refeicao)" , preferredStyle: UIAlertController.Style.alert)
            
            let botaoFechaAlerta = UIAlertAction(title: "fechar", style: UIAlertAction.Style.destructive, handler: nil)
            
            alerta.addAction(botaoFechaAlerta)
            
            present(alerta, animated: true, completion: nil)
           
        }
    }
```

---

#### Encapsulamento

 - Para mostrar todos os detalhes do objeto Refeicao sobreescrevemos o metodo ```description``` da classe ```Refeicao```

```swift
class Refeicao: NSObject {
    
 // ... some code here
 
    public override var description: String{
        return "\n{\nnome: \(nome),\n"
            + "   felicidade: \(felicidade),\n"
            + "   itens: \(itens)\n}\n"
    }
}
```
---

#### Optional Chaining

 - Entendendo o porque de usar uma ? a frente do codigo
 - Isso se chama optional chaining
 - Basicamente o que este trecho esta fazendo seria o equivalente ao codigo abaixo
 
```swift
if(delegate != nil){
   delegate!.add(item)
}
```
 - O codigo fica assim
 
 ```swift
 @IBAction func adicionarItem(_ sender: Any) {
        
      // some code here ...
      
        let item = Item(nome: nomeDoItem, calorias: caloriasTotal)
        

//        if(delegate != nil){
//            delegate!.add(item)
//        }
        
        delegate?.add(item)
    }
```

---

#### Utilizando Handlers e funcoes dentro de funcoes

- Invocando um metodo ao clicar no botao de alerta e declarando uma funcao que sera invocada pelo handler dentro do metodo de ```MostrarDetalhesDaRefeicao```

```swift
@objc func mostrarDetalhesDaRefeicao(_ gesture: UILongPressGestureRecognizer){
        
        if(gesture.state == UIGestureRecognizer.State.began){

            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            
            //self.posicaoListaRefeicao = indexPath.row
            // --- Funcao dentro de outra funcao --- //
            func removeRefeicao(alert: UIAlertAction){
                self.refeicoes.remove(at: indexPath.row)
                tableView.reloadData();
            }
            
            let refeicao = refeicoes[indexPath.row]
            
            let alerta = UIAlertController(title: refeicao.nome, message: "\(refeicao)" , preferredStyle: UIAlertController.Style.alert)
            
            let botaoFechaAlerta = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
            
            let botaoRemoveRefeicao = UIAlertAction(title: "remover", style: .destructive, handler: removeRefeicao)
            
            alerta.addAction(botaoFechaAlerta)
            alerta.addAction(botaoRemoveRefeicao)
            
            present(alerta, animated: true, completion: nil)
            
            
        }
    }
```

---

#### Closures

 - Closures sao funcoes executadas dentro de um handler 
 
 ```swift
class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate { 
   
   // some code here...
   
   @objc func mostrarDetalhesDaRefeicao(_ gesture: UILongPressGestureRecognizer){
    
   // som code from the method here...
    
   // Metodo antigo
         //self.posicaoListaRefeicao = indexPath.row
         // --- Funcao dentro de outra funcao --- //
         // func removeRefeicao(alert: UIAlertAction){
         //    self.refeicoes.remove(at: indexPath.row)
         //    tableView.reloadData();
         // }
            
   // more code here ...

     // Usando Closure
     let botaoRemoveRefeicao = UIAlertAction(title: "remover", style: .destructive, handler: {
         acaoRemover in
         self.refeicoes.remove(at: indexPath.row)
         self.tableView.reloadData()
     })
     
     alerta.addAction(botaoRemoveRefeicao)
            
     present(alerta, animated: true, completion: nil)
     
  }    
} 
    
 ```
 
 - Ou podemos usar invocando metodos em vez de passar todos os parametros a serem executados apos o ```in```
 
 ```swift
 class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate { 
   
   // some code here...

   // metodo que sera invocado dentro da closure
   func removeRefeicaoClosure(posicao: Int) {
       self.refeicoes.remove(at: posicao)
       self.tableView.reloadData()
   }
    
    // some code here
   
   @objc func mostrarDetalhesDaRefeicao(_ gesture: UILongPressGestureRecognizer){
    
   // som code from the method here...
    
   // Metodo antigo
         //self.posicaoListaRefeicao = indexPath.row
         // --- Funcao dentro de outra funcao --- //
         // func removeRefeicao(alert: UIAlertAction){
         //    self.refeicoes.remove(at: indexPath.row)
         //    tableView.reloadData();
         // }
            
   // more code here ...

     // Usando Closure
     let botaoRemoveRefeicao = UIAlertAction(title: "remover", style: .destructive, handler: {
         acaoRemover in
         self.removeRefeicaoClosure(posicao: indexPath.row)
     })
     
     alerta.addAction(botaoRemoveRefeicao)
            
     present(alerta, animated: true, completion: nil)
     
  }    
} 
 ```
---

#### Escaping closures @scaping

- O ```@escaping``` é a referencia da closure que sera executada apos o termino da funçao recorrente, ou seja é a referencia da closure que sera executada depois. Neste exemplo executamos primeiro o metodo ```exibe()``` da classe ```RemoveRefeicaoViewController``` para assim que terminar ele seja executado no metodo ```mostrarDetalhesDaRefeicao``` da classe ```RefeicoesTableViewController```. O codigo fica assim

```swift
class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {

    // some code here ... 
    
    @objc func mostrarDetalhesDaRefeicao(_ gesture: UILongPressGestureRecognizer){
        
        if(gesture.state == UIGestureRecognizer.State.began){

            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler: {
                alertaRemocaoRefeicao in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
        }
    }
}
```

```swift
class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void){
        
        let alerta = UIAlertController(title: refeicao.nome, message: "\(refeicao)" , preferredStyle: UIAlertController.Style.alert)
        
        let botaoFechaAlerta = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
        
        
        let botaoRemoveRefeicao = UIAlertAction(title: "remover", style: .destructive, handler: handler)
        
        
        alerta.addAction(botaoFechaAlerta)
        alerta.addAction(botaoRemoveRefeicao)
        
        controller.present(alerta, animated: true, completion: nil)
    }

}
```

--- 

#### Salvando objetos no device com ```NSCoding```, *Serializando* uma classe e lendo um arquivo serializado

 - Para criar ( salvar ) um arquivo serealizado criei esta classe que faz exatamente isso
  - Para cada funçao preciso apenas informar o caminho da onde o arquivo esta sendo salvo e da onde ele deve ser lido. Deixei de uma forma generica para que qualquer classe possa usar independente do tipo de dado a ser salvo ( aqui salvo tanto uma lista de refeicao quanto uma lista de itens )
 
 ```swift
 import UIKit

class ArquivoService {
    
    func geraArquivo<T>(listaGenerica lista: Array<T>, caminhoDiretorio: String){
        
        guard let caminho = recuperaCaminho(caminhoDiretorio: caminhoDiretorio) else { return }
        
        do {
            let dados =  try NSKeyedArchiver.archivedData(withRootObject: lista, requiringSecureCoding: false)
            
            try dados.write(to: caminho)
            
            print("Arquivo gerado com sucesso")
            
        } catch {
            print("Erro ao gerar arquivo de refeicoes " + error.localizedDescription)
        }
    }
    
    
    
    func carregaArquivo<T>(caminhoDiretorio: String) -> T? {
        
        guard let caminho = recuperaCaminho(caminhoDiretorio: caminhoDiretorio) else { return nil }
        
        print(caminho)
        
        do {
            let dados = try Data(contentsOf: caminho)
            
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? T
            
        }catch {
            print("Erro ao ler arquivo de refeicoes " + error.localizedDescription)
        }
        
        return nil
    }
    
    func recuperaCaminho(caminhoDiretorio: String) -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return diretorio.appendingPathComponent(caminhoDiretorio)
        
    }
}
 ```
 
  - Para acesso a estes metodos 
  
  ```swift
  class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    //    var posicaoListaRefeicao: Int?
    
    let arquivoService = ArquivoService()
    
    // some code here
    
    // Carregando o arquivo para trazer os dados ja cadastrados ao carregar a tela
        override func viewWillAppear(_ animated: Bool) {
        guard let dadosRefeicao: Array<Refeicao>  =  arquivoService.carregaArquivo(caminhoDiretorio: "refeicao") else { return }
        refeicoes = dadosRefeicao
        
        print("tudo certo ate aqui")
    }
       
       
       // somne code here ...
       
       
       // Atualizando o arquivo ao adicionar um item ( refeicao ou item )
           func addRefeicao(_ refeicao: Refeicao) {
        refeicoes.append(refeicao);
        
        //Metodo para recarregar a tela
        tableView.reloadData();
        
        arquivoService.geraArquivo(listaGenerica: refeicoes, caminhoDiretorio: "refeicao")
        
    }
    
    // some code here ...
       
}
  ```
  
 - E por fim serealizando / deserializando uma classe de dominio
  - Use ```NSCoding```
  
 ```swift
 class Refeicao: NSObject, NSCoding {
     // MARK: - Decode
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
    }
    
    required init?(coder: NSCoder) {
        self.nome = coder.decodeObject(forKey: "nome") as! String
        self.felicidade = Int(coder.decodeCInt(forKey: "felicidade"))
        self.itens = coder.decodeObject(forKey: "itens") as! Array<Item>
    }
    
  }
 ```
