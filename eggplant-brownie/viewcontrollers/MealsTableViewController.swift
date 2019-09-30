

import UIKit

class MealsTableViewController : UITableViewController, AddMealDelegate {  //implementa o protocolo ViewControllerDelegate com a funcao add
    
    var meals = Array<Meal>()
    
    //0 _ vc evita chamar o nome do parametro
    func add(_ meal: Meal){           //funcao para adicionar elemento na lista
        meals.append(meal)
        Dao().save( meals)
        tableView.reloadData()
        
    }
        

    override func viewDidLoad() {
 
        self.meals = Dao().load()
      
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
        //Criando uma celula
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        
        //Reconhece qd vc pressiona a celula ele reconhece
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        cell.addGestureRecognizer(longPressRecognizer)
        
        //retorna a celula
        return cell
        
    }
    //reconhece q o botao foi pressionado
    @objc func showDetails(recognizer: UILongPressGestureRecognizer){
        if(recognizer.state == UIGestureRecognizer.State.began){
            let cell = recognizer.view as! UITableViewCell //Qual foi a acao feita
            
            //pega a celula exata
            if let  indexPath = tableView.indexPath(for: cell){
                let row = indexPath.row
                let meal = meals[row]
                RemoveMealController(controller: self).show(meal, handler: { action    //o handler invoca a funcao removeSelected
                    in self.meals.remove(at: row)
                    self.tableView.reloadData()
                })     //invoca a funcao para remover pop up
        }
    }
   
}
}
