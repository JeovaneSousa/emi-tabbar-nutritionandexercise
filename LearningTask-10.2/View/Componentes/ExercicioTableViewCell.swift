//
//  DetalhesTreinoTableViewCell.swift
//  LearningTask-10.2
//
//  Created by jeovane.barbosa on 08/12/22.
//

import UIKit

class ExercicioTableViewCell: UITableViewCell {


    @IBOutlet private weak var simboloLabel: UILabel!
    @IBOutlet private weak var nomeLabel: UILabel!
    @IBOutlet private weak var descricaoLabel: UILabel!
    
    var exercicio: Exercicio? {
        didSet {
            guard let exercicio = exercicio else {return}
            
            simboloLabel.text = exercicio.simbolo
            nomeLabel.text = exercicio.nome
            descricaoLabel.text = exercicio.descricao
        }
    }
    
    
}
