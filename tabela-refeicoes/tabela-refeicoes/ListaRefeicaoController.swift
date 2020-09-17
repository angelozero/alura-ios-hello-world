//
//  ListaRefeicaoController.swift
//  tabela-refeicoes
//
//  Created by Angelo Ferreira on 16/09/20.
//  Copyright © 2020 Angelo Zero. All rights reserved.
//

import UIKit

class ListaRefeicaoController: UITableViewController {
    
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
