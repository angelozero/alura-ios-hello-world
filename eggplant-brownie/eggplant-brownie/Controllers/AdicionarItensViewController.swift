//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Angelo on 6/2/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - Delegate
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    // MARK: Decode
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nomeDoItem = nomeTextField?.text else { return }
        
        guard let caloriasDoItem = caloriasTextField?.text else { return }
        
        guard let caloriasTotal = Double(caloriasDoItem) else { return }
        
        let item = Item(nome: nomeDoItem, calorias: caloriasTotal)
        
        
        // Entendendo o porque de usar uma ? a frente do codigo
        // Isso se chama optional chaining
        // Basicamente o que este trecho esta fazendo seria o equivalente ao codigo comentado
        
        //        if(delegate != nil){
        //            delegate!.add(item)
        //        }
        
        delegate?.add(item)
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Carregamento da tela
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
