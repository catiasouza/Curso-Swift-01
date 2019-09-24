
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var happinessField: UITextField?
    var delegate: AddMealDelegate?  // o viewdelegate observa os eventos
    
    //simulando um array de item na lista
    var items = [
        Item(name: "Eggplant", calories: 10),
        Item(name: "Brownie", calories: 9),
        Item(name: "Brownie", calories: 9),
        Item(name: "Sorvete", calories: 7),
        Item(name: "Merengue", calories: 9),
        Item(name: "Torta", calories: 7)]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count  //devolve o total de itens do array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        return cell
    }
    @IBAction func add(){
        
        if(nameField == nil || happinessField == nil){
            return
        }
        
        let name:String = nameField!.text!
        
        if let happiness = Int(happinessField!.text!){
            let meal = Meal(name: name, happiness: happiness)
            print("eaten \(meal.name) with happines \(meal.happiness)!")
            if (delegate == nil){
                return
            }
            delegate?.add(meal)    //chamando o add refeicao do mealsTable
            if let navigation = navigationController{
                navigation.popViewController(animated: true)
            }
        }
    }
}
