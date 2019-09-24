
import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameField: UITextField?
    @IBOutlet var happinessField: UITextField?
    var mealsTable: MealsTableViewController?
    
    @IBAction func add(){
        
        if(nameField == nil || happinessField == nil){
            return
        }
        
        let name:String = nameField!.text!
        
        if let happiness = Int(happinessField!.text!){
            let meal = Meal(name: name, happiness: happiness)
            print("eaten \(meal.name) with happines \(meal.happiness)!")
            if (mealsTable == nil){
                return
            }
            mealsTable?.add(meal)    //chamando o add refeicao do mealsTable
            if let navigation = navigationController{
                navigation.popViewController(animated: true)
            }
        }
    }
}
