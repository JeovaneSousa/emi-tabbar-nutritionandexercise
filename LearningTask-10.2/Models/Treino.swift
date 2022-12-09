//
//  Treino.swift
//  LearningTask-10.2
//
//  Created by rafael.rollo on 04/08/2022.
//

import Foundation

// Exercicio tem simbolo, nome e descricao

// Treino tem simbolo, titulo, descricao e exercícios

struct Exercicio {
    let simbolo: String
    let nome: String
    let descricao: String
}

struct Treino {
    let simbolo: String
    let titulo: String
    let descricao: String
    let exercicios: [Exercicio]
}

extension Treino: Detailable {
    var symbol: String {
        return simbolo
    }
    
    var title: String {
        return titulo
    }
    
    var subtitle: String {
        return descricao
    }
    
    
}
