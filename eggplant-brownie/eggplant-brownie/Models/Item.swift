//
//  Item.swift
//  eggplant-brownie
//
//  Created by Andriu Felipe Coelho on 16/03/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {

    
    
    // MARK: - Atributos
    
    let nome: String
    let calorias: Double
    
    // MARK: - Init
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
    // MARK: - Decoding
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder: NSCoder) {
        self.nome = coder.decodeObject(forKey: "nome") as! String
        self.calorias = coder.decodeDouble(forKey: "calorias")
    }
    
    
    public override var description: String{
        return "\n{\n   nome: \(nome),\n"
            + "   calorias: \(calorias)\n}\n"
    }
}
