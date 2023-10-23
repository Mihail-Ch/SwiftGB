/*
 1.
Есть словарь с видами чая и их стоимостью. Есть очередь людей, которые хотят заказать чай (можно представить её в виде массива видов чая, которые хотят заказать).
Необходимо последовательно выводить в консоль сколько заплатит покупатель (необходимо вывести его номер по порядку, чай, который он заказал, и стоимость).
*/

enum TeaType: String {
    case green = "зеленый"
    case black = "черный"
    case fruit = "фруктовый"
}

var dictTea: [TeaType: Double] = [.black: 150, .green: 160, .fruit: 180]
var queuePeople: [TeaType] = []

func generateQueue(queue: [TeaType], countQueue: UInt) -> [TeaType] {
    var result: [TeaType] = []
    for _ in 1...countQueue {
        let defoultArray: [TeaType] = [.black, .fruit, .green]
        let randomElement = defoultArray.randomElement()
        queuePeople.append(randomElement!)
    }
    return result
}

func takePrice(tea: TeaType) -> Double {
        switch tea {
        case .black:
            let value = dictTea[.black]
            return value ?? 0
        case .fruit:
            let value = dictTea[.fruit]
            return value ?? 0
        case .green:
            let value = dictTea[.green]
            return value ?? 0
    }
}

func infoTableau(clients: [TeaType]) {
    for (index, tea) in clients.enumerated() {
        print("очередь: \(index + 1), чай: \(tea.rawValue), стоимость: \(takePrice(tea: tea))")
        
    }
}

generateQueue(queue: queuePeople, countQueue: 10)
infoTableau(clients: queuePeople)

print(" ")
/*
 2.
 Есть массив [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]. Необходимо создать новый массив, который будет состоять из элементов старого, но не должно быть nil, не должно быть 0 и 4, а также массив должен быть отсортирован по возрастанию.
 */
var array = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]
var arrayNew = array.compactMap{ $0 }.filter{ $0 != 0 && $0 != 4 }.sorted(by: <)
arrayNew.forEach{ print($0) }

print(" ")

/*
 3.
 Написать функцию, которая на вход принимает целое число, а возвращает массив, который сформирован по следующим правилам: количество элементов соответствует переданному числу, массив начинается с 1, каждый последующий элемент больше предыдущего в 2 раза.
 */
func takeNumber(a: Int) -> [Int] {
    var result = [Int]()
    var number = 1
    for _ in 1...a {
        result.append(number)
        number *= 2
    }
    return result
}
let b = takeNumber(a: 4)
b.forEach { print($0) }
