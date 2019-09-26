
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate ,
AddAnItemDelegate {
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var happinessField: UITextField?
    var delegate: AddMealDelegate?  // o viewdelegate observa os eventos
    var selected = Array<Item>() // variavel de um array vazio que armazena os itens q quero selecionar
    
    //simulando um array de item na lista
    var items = [
        Item(name: "Eggplant", calories: 10),
        Item(name: "Brownie", calories: 9),
        Item(name: "Brownie", calories: 9),
        Item(name: "Sorvete", calories: 7),
        Item(name: "Merengue", calories: 9),
        Item(name: "Torta", calories: 7)]
    
    @IBOutlet var tableView : UITableView?
    
    func add(_ item: Item)  {               //implementa o metodo do AddAnItemViewController
        items.append(item)//adiciono meu item
        if let table = tableView{
            table.reloadData()
            
        } else {
            Alert(controller: self).show("Unable to update items table")
        }
    }
    //Carregar view e cria um botao adicionar
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "new item", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showNewItem))//action invoca o metodo showNewItem
        navigationItem.rightBarButtonItem = newItemButton //cria um botao na barra de navegacao
    }
    @objc func showNewItem(){
        let newItem = NewItemViewController(delegate: self) //Mostra o newItemViewController  diretamente
        if let navigation = navigationController{
            navigation.pushViewController(newItem, animated: true)
        } else{
            Alert ( controller: self).show()
        }
        
    }
    
    //funcao para selecionar item na lista
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){ // valida se a celula existe
            
            //armazenando no array selected os itens selecionados
            let item = items[indexPath.row]
            //verifica se a celula esta marcada, caso não esteja ele marca
            if(cell.accessoryType == UITableViewCell.AccessoryType.none){
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                selected.append(item)
            }else{     //se estiver marcada, ele desmarca
                cell.accessoryType = UITableViewCell.AccessoryType.none
                selected.remove(at: (selected.count - 1))
            }
            
        } else {
            Alert(controller: self).show()
        }
    }
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
    
    func convertToInt(_ text: String?)-> Int?{
        if let number = text{
            return Int(number)
        }
        return nil
    }
    func getMealFromForm() -> Meal? {
        if let name = nameField?.text{
            if let happiness = convertToInt(happinessField?.text){
                print(happiness)
        
                
            }
        }
        
        
        
        if(nameField == nil || happinessField == nil){
            return nil
        }
        
        let name:String = nameField!.text!
        
        if let happiness = Int(happinessField!.text!){
            let meal = Meal(name: name, happiness: happiness, items: selected)//coloca no inicializador
            // lista refeicao recebe item selecionado
            
            print("AMO \(meal.name) E MINHA FELICIDADE \(meal.happiness) E \(meal.items)!")
            return meal
        }
        return nil
    }

    @IBAction func add(){
        
        let meal : Meal? = getMealFromForm()
        if let m = meal{
            if let meals = delegate{
                meals.add(m)
            }
        }
        //chamando o add refeicao do mealsTable
        if let navigation = navigationController{   //sucesso total
            navigation.popViewController(animated: true)
            return
        }
        Alert(controller: self).show("Unable to go back, but the meal was added.")
        return
    }
    
}







    
