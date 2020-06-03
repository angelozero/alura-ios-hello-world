//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Andriu Felipe Coelho on 23/02/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func addRefeicao(_ refeicao: Refeicao)
}

class AdicionaRefeicaoController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
   
    @IBOutlet weak var itensTableView: UITableView!
    
    
    // MARK - Atributos
    
    // Declarando uma variavel referente a table view controller de refeicao.
    // A classe RefeicoesTableViewController agora tem protocolo do qual nos permite acessar apenas o que realmente precisamos e nao todos seu conteudo.
    // Sendo assim tirando a acoplagem de classes
    var delegate: AdicionaRefeicaoDelegate?
    
    
    var itens: [Item] = [Item(nome: "Pao", calorias: 2.0),
                         Item(nome: "Alface", calorias: 2.0),
                         Item(nome: "Tomate", calorias: 2.0),]
    
    var itensSelecionados: [Item] = []
    
    // MARK - IBOutles
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    
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
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        itensTableView.reloadData()
        
    }
    
    //MARK - IBActions
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        
        print("Refeicao: \(refeicao.nome)\nFelicidade: \(refeicao.felicidade)")
        
        
        //Invocando  o metodo de adicionar na lista a nova refeicao informada pelo usuario
        delegate?.addRefeicao(refeicao)
        
        // Metodo para retornar a tela anterior executado quando o botao adicionar for clicado
        navigationController?.popViewController(animated: true)
    }
    
    // Diferenca entre if let e guard let
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let celula = tableView.cellForRow(at: indexPath) else {return}
        
        if(celula.accessoryType == .none){
            celula.accessoryType = .checkmark
            itensSelecionados.append(itens[indexPath.row])
        } else {
            celula.accessoryType = .none
            if let position = itensSelecionados.index(of: itens[indexPath.row]) {
                itensSelecionados.remove(at: position)
            }
            
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = itens[indexPath.row].nome
        return celula
    }
}

