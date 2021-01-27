import UIKit


// Dicionarios - Dictionares
var firstList = [
    "A": "1",
    "B": "2",
    "C": "3",
]

var secondList = [
    "A": "4",
    "G": "5",
]

// Imprime valores da firstList
//firstList.forEach({print($0)})

// Merge entre as listas mantendo apenas a chaves que ja contem na primeira lista
secondList.forEach({
    if !firstList.keys.contains($0.key){
        firstList[$0.key] = $0.value
    }
})

// Imprime valores da secondList
//print(secondList)

// Usando método merge para adicionar valores de uma lista para outra com regras

// 1 - adicionando letterFirstList -> ira adicionar apenas chaves da segunda lista que nao contenham na primeira lista
// "A":"1"
firstList.merge(secondList) { (letterFirstList, _ ) -> String in
    letterFirstList
}

// 1 - adicionando letterSecondList -> ira adicionar apenas chaves da primeira lista que nao contenham na segunda lista
// "A":"6"
firstList.merge(secondList) { (_ , letterSecondList ) -> String in
    letterSecondList
}


//print(firstList)


var nameList = [
    "Angelo": "1",
    "Amelia": "2",
    "Amora":  "3",
    "Bruna":  "3",
    "Claudia": "3",
]

var finalNameList: [String : [String]] = [:]


// Criando chave valor com string<key> e lista_de_string<value>
// ["C": ["Claudia"], "B": ["Bruna"], "A": ["Amora", "Angelo", "Amelia"]]
for name in nameList {
    if let character = name.key.first {
        let prefix = String(character)
        if var namesList = finalNameList[prefix]{
            namesList.append(name.key)
            finalNameList[prefix] = namesList
        } else {
            finalNameList[prefix] = [name.key]
        }

    }
}

//print(finalNameList)

// Agrupando nomes que começam com a letra A em uma unica chave
var dictionaryNameList = Dictionary(grouping: nameList.keys, by: { $0.prefix(1) })

print(dictionaryNameList)


