//
//  NovoTreinoViewController.swift
//  LearningTask-10.2
//
//  Created by jeovane.barbosa on 08/12/22.
//

import UIKit

protocol NovoTreinoViewControllerDelegate: AnyObject {
    func novoTreinoViewController(_ viewController: NovoTreinoViewController, adicionou treino: Treino)
}

class NovoTreinoViewController: UIViewController {

    typealias MensagemDeValidacao = String
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var perfilButtons: [UIButton]!
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var descricaoTextField: UITextField!
    
    var delegate: NovoTreinoViewControllerDelegate?
    
    var exercicios: [Exercicio] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var perfilSelecionado: Int = 1 {
        didSet {
            atualizaViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaViews()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func atualizaViews(){
        perfilButtons.forEach { button in
            button.isEnabled = button.tag != perfilSelecionado
        }
    }
    
    @IBAction func selecionarPerfilDeTreino(_ sender: UIButton) {
        perfilSelecionado = sender.tag
    }
    
    @IBAction func adicionarTreinoButtonPressed(_ sender: UIButton) {
        switch checarFormulario() {
        case (false, let mensagem):
            exibeAlerta(titulo: "Erro", mensagem: mensagem)
        default:
            adicionaTreino()
        }
    }
    
    private func checarFormulario() -> (Bool, MensagemDeValidacao?) {
        guard let title = tituloTextField.text, !title.isEmpty else {
            return (false, "Informe um titulo para o treino")
        }
        
        guard let descricao = descricaoTextField.text, !descricao.isEmpty else {
            return (false, "Informe a descrição do treino")
        }
        
        if exercicios.isEmpty {
            return (false, "Adicione pelo menos um exercício para o treino.")
        }
        
        return (true, nil)
    }

    private func adicionaTreino() {
        let simbolo = perfilButtons.filter({ button in
            button.tag == perfilSelecionado
        }).first!.titleLabel!.text!
        
        let treino = Treino(simbolo: simbolo, titulo: tituloTextField.text!, descricao: descricaoTextField.text!, exercicios: exercicios)
        
        delegate?.novoTreinoViewController(self, adicionou: treino)
        self.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "verFormNovoExercicio" else {return}
        
        guard let destination = segue.destination as? NovoExercicioViewController else {
            fatalError("Unable to acquire necessary data to complete segue: \(segue.identifier!)")
        }
        
        destination.delegate = self
    }
}

//MARK: - Implements Delegation
extension NovoTreinoViewController: NovoExercicioViewControllerDelegate{
    func novoExercicioViewController(_ controller: NovoExercicioViewController, adicionou exercicio: Exercicio) {
        exercicios.append(exercicio)
    }
}

//MARK: - TableView DataSource Implementation
extension NovoTreinoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercicios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciciosTableViewCell", for: indexPath) as? ExercicioTableViewCell else {
            fatalError("Unable to acquire ExercicioTableViewCell to present.")
        }
        let exercicio = exercicios[indexPath.row]
        cell.exercicio = exercicio
        
        return cell
    }
}

//MARK: - TableView Delegate Implementation
extension NovoTreinoViewController: UITableViewDelegate {}




