
import Foundation

class Meal : NSObject, NSCoding {
    let name : String
    let happiness : Int
    var items = Array<Item>()
    
    init(name: String, happiness:Int, items: Array<Item> = []) { //inicializador
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
   required init?(coder aDecoder: NSCoder){
    self.name =  aDecoder.decodeObject(forKey: "name") as! String
    self.happiness = aDecoder.decodeObject(forKey: "happiness") as! Int
    self.items = aDecoder.decodeObject(forKey: "items") as! Array
    
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(happiness, forKey: "happiness")
        coder.encode(items, forKey: "items")
    }
    
    func allCalories()->Double{
        var total = 0.0
        for item in items{
            total += item.calories
        }
        return total
    }
    func details() -> String {
        //mostrar msg de alerta
        var message = "Happiness: \(happiness)"
        for item in items{
            message += "\n \(item.name) - calories: \(item.calories)"
        }
        return message
    }
}
