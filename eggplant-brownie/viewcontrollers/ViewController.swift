
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
    
    func add(_ item: Item)  { //implementa o metodo do AddAnItemViewController
        items.append(item)    //adiciono meu item
        if let table = tableView{
        table.reloadData()//atualiza a tela
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
    
    
    @IBAction func add(){
        
        if(nameField == nil || happinessField == nil){
            return
        }
        
        let name:String = nameField!.text!
        
        if let happiness = Int(happinessField!.text!){
            let meal = Meal(name: name, happiness: happiness, items: selected)//coloca no inicializador
             // lista refeicao recebe item selecionado
            
            print("AMO \(meal.name) E MINHA FELICIDADE \(meal.happiness) E \(meal.items)!")
            
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


