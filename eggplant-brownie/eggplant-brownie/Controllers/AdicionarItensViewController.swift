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
    
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    
    var delegate: AdicionaItensDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nomeDoItem = nomeTextField?.text else { return }
        
        guard let caloriasDoItem = caloriasTextField?.text else { return }
        
        guard let caloriasTotal = Double(caloriasDoItem) else { return }
        
        let item = Item(nome: nomeDoItem, calorias: caloriasTotal)
        
        delegate?.add(item)
        
        navigationController?.popViewController(animated: true)
    }
    
}
