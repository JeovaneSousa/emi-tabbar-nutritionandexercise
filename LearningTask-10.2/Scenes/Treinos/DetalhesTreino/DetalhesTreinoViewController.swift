//
//  DetalhesTreinoViewController.swift
//  LearningTask-10.2
//
//  Created by jeovane.barbosa on 08/12/22.
//

import UIKit

class DetalhesTreinoViewController: UITableViewController {

    var treino: Treino! {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        setupViews()
    }
    
    private func setupViews(){
        tableView.tableHeaderView = DetailsTableHeaderView.build(from: treino)
        
        tableView.register(DefaultTableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: DefaultTableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = DefaultTableSectionHeaderView.alturaBase
        tableView.sectionHeaderTopPadding = 0
    }

    // MARK: - Implements DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return treino.exercicios.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciciosTableViewCell", for: indexPath) as? ExercicioTableViewCell else {
            fatalError("Unable to acquire DetalhesTreinoTableViewCell to present.")
        }
        
        let exercicio = treino.exercicios[indexPath.row]
        cell.exercicio = exercicio
        
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: DefaultTableSectionHeaderView.reuseId) as? DefaultTableSectionHeaderView else {
            fatalError("Unable to acquire SectionHeader to present.")
        }
        
        headerView.titulo = "Exercícios"
        return headerView
    }

}
