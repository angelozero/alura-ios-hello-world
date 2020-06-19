//
//  ArquivoService.swift
//  eggplant-brownie
//
//  Created by Angelo on 6/17/20.
//  Copyright © 2020 Alura. All rights reserved.
//

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
