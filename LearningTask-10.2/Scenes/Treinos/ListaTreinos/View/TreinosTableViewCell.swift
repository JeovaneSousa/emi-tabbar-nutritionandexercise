//
//  TreinosViewCell.swift
//  LearningTask-10.2
//
//  Created by jeovane.barbosa on 08/12/22.
//

import UIKit

class TreinosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var simboloLabel: UILabel!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    var treino: Treino? {
        didSet {
            guard let treino = treino else {return}
            
            simboloLabel.text = treino.simbolo
            tituloLabel.text = treino.titulo
            descricaoLabel.text = treino.descricao
        }
    }
}
