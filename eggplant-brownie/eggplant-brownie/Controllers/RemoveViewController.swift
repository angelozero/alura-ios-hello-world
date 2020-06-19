import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void){
        
        let alerta = UIAlertController(title: refeicao.nome, message: "\(refeicao)" , preferredStyle: UIAlertController.Style.alert)
        
        let botaoFechaAlerta = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
        
        let botaoRemoveRefeicao = UIAlertAction(title: "remover", style: .destructive, handler: handler)
        
        
        alerta.addAction(botaoFechaAlerta)
        alerta.addAction(botaoRemoveRefeicao)
        
        controller.present(alerta, animated: true, completion: nil)
    }

}
