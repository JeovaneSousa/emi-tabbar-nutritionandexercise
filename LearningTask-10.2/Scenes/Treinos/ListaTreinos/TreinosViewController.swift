//
//  TreinosViewController.swift
//  LearningTask-10.2
//
//  Created by jeovane.barbosa on 08/12/22.
//

import Foundation
import UIKit

class TreinosViewController: UITableViewController {
    
    var treinosApi: TreinosAPI?
    
    var treinos: [Treino] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        applyTheme()
        setupViews()
        carregaTreinos()
    }
    
    private func setupViews(){
        tableView.tableHeaderView = DefaultTableHeaderView.build(with: "Seu protocolo de treinos")
    }
    
    private func carregaTreinos(){
        guard let api = treinosApi else {return}
        treinos = api.carregaTodos()
    }
    
}

//MARK: - Implements transitions
extension TreinosViewController {
    
    private enum PossibleSegues: String {
        case verDetalhesTreino, verFormNovoTreino
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueId = segue.identifier,
              let chosenSegue = PossibleSegues(rawValue: segueId) else {return}
        
        switch chosenSegue {
        case .verDetalhesTreino:
            prepareForDetalhesTreinoSegue(segue, sender)
        case .verFormNovoTreino:
            prepareForNovoTreinoSegue(segue, sender)
        }
    }
    
    private func prepareForDetalhesTreinoSegue(_ segue: UIStoryboardSegue,_ sender: Any?){
        guard let cell = sender as? TreinosTableViewCell,
             let destino = segue.destination as? DetalhesTreinoViewController else {
            fatalError("Unable to acquire necessary data to complete segue: \(segue.identifier!)")
        }
        destino.treino = cell.treino
        
        
    }
    private func prepareForNovoTreinoSegue(_ segue: UIStoryboardSegue,_ sender: Any?){
        guard let destination = segue.destination as? NovoTreinoViewController else {
            fatalError("Unable to acquire necessary data to complete segue: \(segue.identifier!)")
        }
        
        destination.delegate = self
    }
}
    

//MARK: - Implements Delegation
extension TreinosViewController: NovoTreinoViewControllerDelegate {
    func novoTreinoViewController(_ viewController: NovoTreinoViewController, adicionou treino: Treino) {
        treinos.append(treino)
    }
    
    
}

//MARK: - Implements DataSource
extension TreinosViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return treinos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TreinoTableViewCell", for: indexPath) as? TreinosTableViewCell else {
            fatalError("Unable to acquire TreinosViewCell to present.")
        }
        let treino = treinos[indexPath.row]
        cell.treino = treino
        return cell
    }
}
