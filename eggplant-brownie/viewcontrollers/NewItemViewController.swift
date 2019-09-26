
import UIKit

class NewItemViewController: UIViewController {
    
    var  delegate: AddAnItemDelegate?
    
    init(delegate: AddAnItemDelegate){
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    @IBOutlet var nameField : UITextField?
    @IBOutlet var caloriesField : UITextField?
    
    @IBAction func addNdewItem(){       //Quando clicar no botao add do .xib ele executa essa funcao
        let name = nameField!.text      //ler o campo
        let calories = Double( caloriesField!.text!)
        
        if(name == nil || calories == nil || delegate == nil){
            return
        }
        let item = Item (name: name!, calories: calories!)
        
        delegate!.add(item)
        
        print("adding new item")
        if let navigation = navigationController{  // Volta p tela anterior pagando a view atual
            navigation.popViewController(animated: true)
        }
        
    }

}
