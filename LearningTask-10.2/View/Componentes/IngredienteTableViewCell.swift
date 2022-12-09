//
//  IngredienteTableViewCell.swift
//  LearningTask-10.2
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class IngredienteTableViewCell: UITableViewCell {

    @IBOutlet private weak var simboloLabel: UILabel!
    @IBOutlet private weak var nomeLabel: UILabel!
    @IBOutlet private weak var quantidadeLabel: UILabel!
    
    var ingrediente: Ingrediente? {
       didSet {
           guard let ingrediente = ingrediente else { return }
           
           simboloLabel.text = ingrediente.simbolo
           nomeLabel.text = ingrediente.nome
           quantidadeLabel.text = ingrediente.quantidade
        }
    }

}
