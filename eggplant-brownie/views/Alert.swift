import UIKit
import Foundation

class Alert{
    
    let controller: UIViewController
    init(controller: UIViewController){
        self.controller = controller
    }
    func show(_ message: String){
        
         let alert =  UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertController.Style.alert)
         let ok = UIAlertAction(title: "Understood", style: UIAlertAction.Style.cancel, handler: nil)
             alert.addAction(ok)
             controller.present(alert, animated: true, completion: nil)
        
    }
}
