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

