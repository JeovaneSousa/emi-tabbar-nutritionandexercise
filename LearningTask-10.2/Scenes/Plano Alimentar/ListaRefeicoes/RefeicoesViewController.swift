//
//  RefeicoesViewController.swift
//  LearningTask-10.2

//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class RefeicoesViewController: UITableViewController {
    
    var refeicoesAPI: RefeicoesAPI?
    
    var refeicoes: [Refeicao] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        setupViews()
        carregaRefeicoes()
    }
    
    func setupViews() {
        let titulo = "Qual sua \npróxima refeição?"
        tableView.tableHeaderView = DefaultTableHeaderView.build(with: titulo)
    }
    
    func carregaRefeicoes() {
        guard let refeicoesAPI = refeicoesAPI else { return }
        refeicoes = refeicoesAPI.carregaTodas()
    }
    
}

// MARK: - Navigation related implementations
extension RefeicoesViewController {
    
    private enum Segues: String {
        case verDetalhesRefeicao = "verDetalhesRefeicaoSegue"
        case verFormNovaRefeicao = "verFormRefeicaoSegue"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let id = segue.identifier,
              let segueEsperada = Self.Segues(rawValue: id) else { return }
        
        switch segueEsperada {
        case .verDetalhesRefeicao:
            prepareForDetalhesRefeicao(segue, sender)
        case .verFormNovaRefeicao:
            prepareForFormNovaRefeicao(segue, sender)
        }
    }
    
    private func prepareForDetalhesRefeicao(_ segue: UIStoryboardSegue, _ sender: Any?) {
        guard let celula = sender as? RefeicaoTableViewCell,
              let controllerDestino = segue.destination as? DetalhesRefeicaoViewController else {
            fatalError("Não foi possível executar a segue \(segue.identifier!)")
        }
        
        controllerDestino.refeicao = celula.refeicao
    }
    
    private func prepareForFormNovaRefeicao(_ segue: UIStoryboardSegue, _ sender: Any?) {
        guard let controllerDestino = segue.destination as? NovaRefeicaoViewController else {
            fatalError("Não foi possível executar a segue \(segue.identifier!)")
        }
        controllerDestino.delegate = self
    }
    
}

// MARK: - NovaRefeicaoViewController delegation implementation
extension RefeicoesViewController: NovaRefeicaoViewControllerDelegate {
    func novaRefeicaoViewController(_ controller: NovaRefeicaoViewController, adicionou refeicao: Refeicao) {
        refeicoes.append(refeicao)
    }
}

// MARK: - UITableViewDataSource related code
extension RefeicoesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celula = tableView.dequeueReusableCell(withIdentifier: "RefeicaoTableViewCell", for: indexPath) as? RefeicaoTableViewCell else {
            fatalError("Não foi possível obter célula para a lista de refeições")
        }
        
        celula.refeicao = refeicoes[indexPath.row]
        return celula
    }

}
