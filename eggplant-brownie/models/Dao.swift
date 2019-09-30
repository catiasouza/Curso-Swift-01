

import Foundation

class Dao {
    
    let mealsArchive: String
    let itemsArchive: String
    
    init(){
        let userDirs =
            NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
                                                FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        print("saving at \(String(describing: dir))/")
        self.mealsArchive =  "\(dir) /eggplant-brownie-meals.dados" //criando arquivo
        self.itemsArchive = "\(dir) /eggplant-brownie-items.dados"
        
    }
    
    func save(_ meals:Array<Meal>){
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive)
    }
    
    //funcao que devolve um array de meal
    func load() -> Array<Meal> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: mealsArchive){
                  let meals =  loaded as! Array<Meal>
            return meals
            
        }
        return []
    }
    //Salvando itens
    func save(_ items: Array<Item>){
        NSKeyedArchiver.archiveRootObject (items, toFile: itemsArchive)
    }
    
    //funcao que devolve um array de item
    func load() -> Array<Item> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: itemsArchive){
              let items =  loaded as! Array<Item>
        return items
    }
        return []
    }
    
    //refeicao adiciona refeicao
}
