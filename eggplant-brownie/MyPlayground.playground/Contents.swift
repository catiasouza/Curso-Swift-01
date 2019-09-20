import UIKit

var name = "Catia"
var project = "Eggplant brownie"

name = "Kaka"
print(name)
print (project)

func helloCalorias(){
    let product = "brownie"
    print("Hello Calorias! \(product) ")
}

helloCalorias()  // chamando a funcao

var estado = "😆"
print(estado)

var 😡 = "kakak"
print(😡)

func add(name:String, calories:Double){ // funcao com parametro
    print("adding \(name) with \(calories)")
}
add(name: "Brownie", calories: 30.5)

// manipulando arrays
let calorias = [50.5, 60, 10.7, 500]
print("\(calorias ) imprimindo o array inteiro")

for i in 0...3{
    print("\(calorias[i] ) imprimindo a posicao do array")}

for i in 0...(calorias.count - 1){
    print(calorias[i])
}
print()
for call in calorias{
    print(call)
}
print()

//implicito e explicito
func allCallories(calorias: Array<Double>)-> Double {
    var total: Double = 0
    for c in calorias{
        total += c
    }
    return total
    
}
allCallories(calorias: [10.8,200,87,100])

//CLASSES
class Meal{
    var happiness = 5
    var name = "eggplant brownie"
}
let brownie = Meal()

print(brownie.name)
//MUDANDO AS VARIAVEIS DA CLASSE(QUE NAO SAO CONSTANTES)
brownie.name = "sundubu"
print(brownie.name)

//INICIANDO AS VARIAVEIS OPCIONAIS

class Doce{
    var frutas : Int?
    var sobremesa : String?
}
var doceria = Doce()
doceria.frutas = 6
doceria.sobremesa = "brigadeiro"
print(doceria.frutas)
print(doceria.sobremesa)
print(doceria.sobremesa!.uppercased()) //AFIRMANDO QUE A VARIAVEL IRA RECEBER VALOR

var frutas : String?
frutas = "Laranja"
print(frutas)
print(frutas!.uppercased())

 //Optionals com interrogação e exclamação e além de um unwrapping com let
