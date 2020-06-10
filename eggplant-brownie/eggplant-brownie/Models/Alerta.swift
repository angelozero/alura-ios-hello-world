import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(_ controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(titulo: String = "Erro", mensagem: String = "erro ao atualizar a tabela", estilo: UIAlertController.Style = UIAlertController.Style.alert){
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: estilo)
        
        let okButton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
        
        alerta.addAction(okButton)
        
        controller.present(alerta, animated: true, completion: nil)
    }
}
