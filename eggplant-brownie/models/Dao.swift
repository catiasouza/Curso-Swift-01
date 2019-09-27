

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
        mealsArchive =  "\(dir) /eggplant-brownie-meals.dados" //criando arquivo
        itemsArchive = "\(dir) /eggplant-brownie-items.dados"
        
    }
    
    func saveMeals(meals:Array<Meal>){
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive)
    }
    
    func loadMeals() -> Array<Meal> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: mealsArchive){
                  let meals =  loaded as! Array<Meal>
            return meals
            
        }
        return []
    }
    
    func saveItems(items: Array<Item>){
        NSKeyedArchiver.archiveRootObject (items, toFile: mealsArchive)
    }
    func loadItems() -> Array<Item> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: itemsArchive){
              let items =  loaded as! Array<Item>
        return items
    }
        return []
    }
    
    //refeicao adiciona refeicao
}
