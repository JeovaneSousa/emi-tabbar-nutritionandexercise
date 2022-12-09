//
//  NovoExercicioViewController.swift
//  LearningTask-10.2
//
//  Created by jeovane.barbosa on 09/12/22.
//

import UIKit

protocol NovoExercicioViewControllerDelegate: AnyObject {
    func novoExercicioViewController(_ controller: NovoExercicioViewController, adicionou exercicio: Exercicio)
}

class NovoExercicioViewController: UIViewController {
    
    typealias MensagemDeValidacao = String
    
    @IBOutlet private weak var nomeTextField: UITextField!
    @IBOutlet private weak var simboloTextField: UITextField!
    @IBOutlet private weak var descricaoTextField: UITextField!
    
    weak var delegate: NovoExercicioViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func checarFormulario() -> (Bool, MensagemDeValidacao?) {
        if let nome = nomeTextField.text, nome.isEmpty {
            return (false, "Informe um nome para o exercício.")
        }
        
        if let descricao = descricaoTextField.text, descricao.isEmpty {
            return (false, "Informe uma descrição para o exercício.")
        }
        
        if let simbolo = simboloTextField.text, simbolo.isEmpty {
            return (false, "Informe um simbolo para o exercício.")
        }
        
        return (true, nil)
    }
    
    @IBAction func adicionarExercicioButtonPressed(_ sender: UIButton) {
        switch checarFormulario() {
            
        case (false, let mensagem):
            exibeAlerta(titulo: "Erro", mensagem: mensagem)
            
        default:
            adicionaExercicio()
        }
    }
    
    private func adicionaExercicio() {
        let exercicio = Exercicio(simbolo: simboloTextField.text!,
                                  nome: nomeTextField.text!,
                                  descricao: descricaoTextField.text!)
        
        delegate?.novoExercicioViewController(self, adicionou: exercicio)
        
        self.dismiss(animated: true)
    }
}
    
// MARK: - UITextField delegation related code
extension NovoExercicioViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        guard let currentText = textField.text,
              currentText.isEmpty || string.isEmpty else { return false }
        
        return true
    }
}
    

