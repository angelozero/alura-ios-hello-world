//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Angelo on 5/19/20.
//  Copyright © 2020 Alura. All rights reserved.
//

//MARK: - Import - removendo o Foudation e usando o UIKit
//Remover este import Foundation e usar o UIKit, ele é o framework que gerencia os elementos de tela, ele que tem todas as bibliotecas de interface do usuario
//import Foundation
import UIKit


class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    //MARK: - Declaracao de variaveis
    let arquivoService = ArquivoService()
    
    var refeicoes: Array<Refeicao> = []
    
    //MARK: - Carregamento da tela
    override func viewDidLoad() {
        guard let dadosRefeicao: Array<Refeicao>  =  arquivoService.carregaArquivo(caminhoDiretorio: "refeicao") else { return }
        refeicoes = dadosRefeicao
        
        print("tudo certo ate aqui")
    }
    
    
    //MARK: - Tratamento das celulas da tela
    
    // Metodo que retorna a quantidade de celulas referente o tamanho da lista de refeicao
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count;
    }
    
    // Metodo que preenche cada celula com o nome da refeicao e usa gesture / longpress
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        celula.textLabel?.text = refeicoes[indexPath.row].nome;
        
        // primeiro criamos um gestureRecognizer
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhesDaRefeicao(_:)))
        
        // adicionamos o evento a celula
        celula.addGestureRecognizer(longPress)
        
        return celula;
        
    }
    
    //MARK: - Metodo auxiliar para tratamento das celulas
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
    
    //MARK: - Segue
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
    
    //MARK: - Adicionando uma Refeicao
    func addRefeicao(_ refeicao: Refeicao) {
        refeicoes.append(refeicao);
        
        //Metodo para recarregar a tela
        tableView.reloadData();
        
        arquivoService.geraArquivo(listaGenerica: refeicoes, caminhoDiretorio: "refeicao")
    }
}
