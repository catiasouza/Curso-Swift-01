import UIKit

class Caozinhos{
    var raca: String
    var idade: Int
    var caract = Array<Caracteristicas>()
    
    init(raca: String, idade: Int){
        self.raca = raca
        self.idade = idade
    }
    
    func pesoTotal() -> Double {
        var total = 0.0
        for i in caract {
            total += i.peso
        }
        return total
    }
}
class Caracteristicas {
    var nome: String
    var peso: Double
    
    init(nome: String, peso: Double){
        self.nome = nome
        self.peso = peso
    }
}

let cao = Caozinhos(raca: "Samoieda", idade: 3)
print(cao.raca)

let caozinho1 = Caracteristicas(nome: "Doberman", peso: 3)
let caozinho2 = Caracteristicas(nome: "Samoieda", peso: 2)
cao.caract.append(caozinho1)
cao.caract.append(caozinho2)
print(cao.pesoTotal())
