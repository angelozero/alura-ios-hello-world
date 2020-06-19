//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Andriu Felipe Coelho on 16/03/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class Refeicao: NSObject, NSCoding {

    
    
    // MARK: - Atributos
    
    let nome: String
    let felicidade: Int
    let itens: Array<Item>
    
    // MARK: - Init
    
    init(nome: String, felicidade: Int, itens: Array<Item> = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
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
    
    
    
    // MARK: - Metodos
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
    
    public override var description: String{
        return "\n{\nnome: \(nome),\n"
            + "   felicidade: \(felicidade),\n"
            + "   itens: \(itens)\n}\n"
    }
}
