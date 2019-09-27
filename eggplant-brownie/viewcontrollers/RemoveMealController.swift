import UIKit
import Foundation

class RemoveMealController{
    
    let controller: UIViewController
    init(controller: UIViewController){
    self.controller = controller
    }
    
    func show(_ meal: Meal, handler:@escaping (UIAlertAction) -> Void){
         
        
        //cria um controller
        let details  =  UIAlertController(title: meal.name, message: meal.details(),  preferredStyle: UIAlertController.Style.alert)
        
        func removeSelected(action: UIAlertAction){
            //                    meals.remove(at: row)
            //                    tableView.reloadData() //remove item da lista
        }
        
        //pop up de remover - cria uma acao p controller
        let remove = UIAlertAction(title: "Remove ", style: UIAlertAction.Style.destructive, handler: handler)
        details.addAction(remove)
        
        let Cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        details.addAction(Cancel)
        //apresentar na tela a msg
        controller.present(details, animated: true, completion: nil)
    }
}

