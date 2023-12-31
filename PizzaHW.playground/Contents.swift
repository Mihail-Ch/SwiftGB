extension Array {
    var toPrint: String  {
        var str = ""
        for element in self {
            str += "\(element) "
        }
        return str
    }
}

protocol MenuProtocol {
    var cost: Double {get}
    
    func descriptionTitle() -> String
}

protocol WorkTime {
    func openPizzeria()
    func closePizzeria()
}

struct PizzeriaWorker {
    
    enum Post: String {
        case cashier = "кассир"
        case cook = "повар"
    }
    
    var name: String
    var salary: Double
    var post: String
  
}

struct ModelPotatoFree: MenuProtocol {
    
    enum SizeBoxPotatoFree: String {
        case small = "маленькая"
        case midle = "средняя"
        case big = "большая"
    }
    
    var cost: Double
    var size: SizeBoxPotatoFree
    
    func descriptionTitle() -> String {
        "\(size.rawValue) картошка, цена \(cost)"
    }
}

struct ModelPizza: MenuProtocol {
    
    enum PizzaView: String {
        case pepperoni = "'пепперони'"
        case cheese = "'сырная'"
        case seaFood = "с 'морепродуктами'"
        case pineapple = "'ананасовая'"
        case meat = "'мясная'"
        case margarita = "'маргарита'"
    }
    
    enum Dough: String {
        case thin = "тонком"
        case thick = "толстом"
    }
    
    enum Supplementation: String {
        case cheese = "'сыр'"
        case tomato = "'помидоры'"
        case pepperoni = "'пепперони'"
    }
    
    var cost: Double
    let viewPizza: PizzaView
    let dough: Dough
    var supplementation: [Supplementation]? = nil
    
    func descriptionTitle() -> String {
        if supplementation != nil {
            "\(viewPizza.rawValue) на \(dough.rawValue) тесте, c добавками \(supplementation?.map({ $0.rawValue }).toPrint ?? " "), цена: \(cost) ₽"
        } else {
            "\(viewPizza.rawValue) на \(dough.rawValue) тесте, цена: \(cost) ₽"
        }
    }
}

class Tables {
    var numberOfSeats: UInt
    weak var pizzeria: Pizzeria?
    
    
    init() {
        numberOfSeats = 4
    }
    
    func boardingOfGuests(guests: UInt) -> Bool {
        if numberOfSeats >= guests {
            return true
        } else {
            return false
        }
    }
}

class Pizzeria {
  
    private var pizzaria: [MenuProtocol]
    var employee: [PizzeriaWorker] = []
    var tablesArray: [Tables]
    
    
    init(pizzas: [MenuProtocol]) {
        self.pizzaria = pizzas
        tablesArray = [Tables]()
    }
    
    func addPosition(add: MenuProtocol) {
        pizzaria.append(add)
    }
 
    func returnAllTitle() -> [MenuProtocol] {
        for (index, title) in pizzaria.enumerated() {
            print("\(index + 1) - \(title.descriptionTitle())")
        }
        return pizzaria
    }
    
    func returnTitle(number: Int) -> MenuProtocol {
        for (index, _) in pizzaria.enumerated() {
            if number == index + 1 {
                return pizzaria[number]
            } else {
                break
            }
        }
        return pizzaria[0]
    }
}

extension Pizzeria: WorkTime {
    
    func openPizzeria() {
        print("Пиццерия открыта")
    }
    
    func closePizzeria() {
        print("Пиццеряия закрыта")
    }
}

var pizzeria = Pizzeria(pizzas: [
    ModelPizza(cost: 1200, viewPizza: .cheese, dough: .thin),
    ModelPizza(cost: 1300, viewPizza: .cheese, dough: .thick, supplementation: [.cheese]),
    ModelPotatoFree(cost: 70, size: .small)
])

//pizzeria.tablesArray.numberOfSeats
//pizzeria.tablesArray.boardingOfGuests(guests: 8)
pizzeria.tablesArray.append(Tables())
let tableSecond = Tables()
pizzeria.tablesArray.append(tableSecond)
pizzeria.tablesArray.count
let table = pizzeria.tablesArray


pizzeria.openPizzeria()
pizzeria.addPosition(add: ModelPizza(cost: 490, viewPizza: .margarita, dough: .thin))
pizzeria.addPosition(add: ModelPotatoFree(cost: 120, size: .big))
pizzeria.returnAllTitle()

let myOrder = pizzeria.returnTitle(number: 1)
print(" ")
print(myOrder.descriptionTitle())
pizzeria.closePizzeria()



