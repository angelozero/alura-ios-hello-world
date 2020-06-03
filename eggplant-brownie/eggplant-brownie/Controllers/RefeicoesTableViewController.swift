//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Angelo on 5/19/20.
//  Copyright © 2020 Alura. All rights reserved.
//

//Remover este import Foundation e usar o UIKit, ele é o framework que gerencia os elementos de tela, ele que tem todas as bibliotecas de interface do usuario
//import Foundation
import UIKit



class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
 
    var refeicoes = [Refeicao(nome: "Pizza", felicidade: 4),
                     Refeicao(nome: "Lanche", felicidade: 5),
                     Refeicao(nome: "Salada", felicidade: 2)]
    
    
    func addRefeicao(_ refeicao: Refeicao) {
        refeicoes.append(refeicao);
        
        //Metodo para recarregar a tela
        tableView.reloadData();
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count;
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        celula.textLabel?.text = refeicoes[indexPath.row].nome;
        
        return celula;
        
    }
    
    
    
    // Metodo que é invocado antes do comando "segue", comando que chama a proxima tela
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Verificando se o identifcador do segue é addRefeicao, que se refere a tela da qual ele esta relacionado
        if(segue.identifier == "addRefeicao"){
            // Aqui acesso a classe da refeicao e inicializo a variavel declarada ---> var refeicoesTableViewController: RefeicoesTableViewController?
            // o if fica da seguinte maneira:
            // se na hora de interceptar a proxima tela, a variavel conseguir ser convertida ( cast ) para UIViewController ( que é o tipo da classe ViewController )
            if let viewController = segue.destination as? AdicionaRefeicaoController {
                // Entao inicializa
                viewController.delegate = self
            }
        }
        
    }
    
    
    // Entendendo a diferenca de se usar o "_" ou um nome como nome do metodo no parametro do metodo
    // 1 - _ -> o underline faz com que o nome do parametro nao seja exibido na chamada do metodo, ficando desta maneira
    
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
    
    // 2 - usando o nome dentro do parametro
    // Usar o nome dentro do parametro explica tambem alguns metodos que o proprio swift usa
    
    // Usando um nome no lugar do _
    func sumOnly(doubleValues n1: Double, n2: Double) -> Double {
        return n1 + n2;
    }
    
    func exampleMethodNameParameter(){
        
        // Para encontrar o metodo sumOny podemos buscar vida CTRL + barra de espaço o nome dele que é double values
        // A leitura do metodo fica mais ou menos assim
        // Sum only double values ou Somando apenas valores do tipo double
        //doubleValu ... + CTRL + barra de espaço
        
        let sumDoubleValuesResult = sumOnly(doubleValues: 2.5, n2: 7.2);
        print("Sum dobule values result is \(sumDoubleValuesResult)")
        
    }
        
}
