//
//  ViewController.swift
//  tabela-refeicoes
//
//  Created by Angelo on 5/18/20.
//  Copyright © 2020 Angelo Zero. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    let refeicoes = ["Pizza", "Macarrao", "Arroz e Feijao"];
    
    // Metodo inicial que exibe o carregamento da tela
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TableViewController foi carregada com sucesso")
    }

    // Metodo que retorna a quantidade de linhas que a tabela deve ter
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    
    // Metodo que preenche a lista com os valores da lista refeicoes
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .subtitle, reuseIdentifier: nil);

        let refeicao = refeicoes[indexPath.row]
        
        celula.textLabel?.text = refeicao
        
        return celula  
    }
}

