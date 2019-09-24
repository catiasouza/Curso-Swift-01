

import UIKit

class MealsTableViewController : UITableViewController, ViewControllerDelegate {  //implementa o procolo ViewControllerDelegate com a funcao add
    
    var meals:Array<Meal> = [Meal(name: "Eggplante", happiness: 5),
                             Meal(name: "Zuchini Muffin", happiness: 4),
                             Meal(name: "Hamburguer", happiness: 10),
                             Meal(name: "Bolo", happiness: 8)]
    
    //0 _ vc evita chamar o nome do parametro
    func add(_ meal: Meal){           //funcao para adicionar elemento na lista
        meals.append(meal)          //refeicao adiciona refeicao
        tableView.reloadData()      //TableView recarregue os dados
    }
    //segue e uma acao de navegar entre telas
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "addMeal") {         //verifica se a tela e  a que vc quer
        let view  = segue.destination as! ViewController
        view.delegate = self
    }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        return cell

}
}
