
/*
1. Создать перечисление с видами пиццы (хотя бы 4 - 5 кейсов)
2. Создать структуру пиццы, она должна содержать:
 - стоимость,
 - вид пиццы,
 - толстое или тонкое тесто
 - и добавки (например, дополнительно добавить пепперони, помидоры, сыр).
 Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением.
3. Создать класс пиццерии, добавить массив с возможными пиццами. Переменная с массивом должна быть приватной. Массив задается в инициализаторе.
4. Написать в классе пиццерии функции для добавления новой пиццы и для получения всех доступных пицц.
5. Создать экземпляр класса пиццерии и добавить в него несколько пицц.
*/



struct ModelPizza {
    
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
    
}
/*
3. - Создать класс пиццерии, добавить массив с возможными пиццами.
   - Переменная с массивом должна быть приватной.
   - Массив задается в инициализаторе.
4. Написать в классе пиццерии функции 
   - для добавления новой пиццы
   - и для получения всех доступных пицц.
5. Создать экземпляр класса пиццерии и добавить в него несколько пицц.
*/

class Pizzeria {
    
    private var pizzas: [ModelPizza]
    
    init(pizzas: [ModelPizza]) {
        self.pizzas = pizzas
    }
    
    func addPizza(add: ModelPizza) {
        pizzas.append(add)
    }
    
    //Получаем заказ
    func takePizza(pizza: ModelPizza) {
        if pizza.supplementation != nil {
            print("Ваша пицца \(pizza.viewPizza.rawValue) на \(pizza.dough.rawValue) тесте, c добавками \(pizza.supplementation?.map({ $0.rawValue }).toPrint ?? " ") готова, цена: \(pizza.cost) ₽")
        } else {
            print("Ваша пицца \(pizza.viewPizza.rawValue) на \(pizza.dough.rawValue) тесте, готова, цена: \(pizza.cost) ₽")
        }
    }
    
    //Делаем заказ
    func makeAnOrder(pizza: Int, add: [ModelPizza.Supplementation]?) -> ModelPizza {
        var result = pizzas[pizza - 1]
        print(result)
        if  let supplement = add {
            result.cost += 100
            result.supplementation = add
            print("Ваша пицца \(result.viewPizza.rawValue) на \(result.dough.rawValue) тесте, c добавками \(result.supplementation?.map({ $0.rawValue }).toPrint ?? " ") готова, цена: \(result.cost) ₽")
            return result
        }
        print("Ваша пицца \(result.viewPizza.rawValue) на \(result.dough.rawValue) тесте, готова, цена: \(result.cost) ₽")
        return result
    }
    
    
    
    //Выводит все доступные пиццы
    func printPizza() {
        for (index, pizza) in pizzas.enumerated() {
            print("Номер пиццы - \(index + 1):\n \(pizza.viewPizza.rawValue) на \(pizza.dough.rawValue) тесте, цена: \(pizza.cost) ₽")
        }
    }
    
    func returnPizzas() -> [ModelPizza] {
        pizzas
    }
}

var pizzeria = Pizzeria(pizzas: [
    ModelPizza(cost: 800.0, viewPizza: .cheese, dough: .thick),
    ModelPizza(cost: 850, viewPizza: .cheese, dough: .thin),
    ModelPizza(cost: 650, viewPizza: .pepperoni, dough: .thin),
    ModelPizza(cost: 670, viewPizza: .pepperoni, dough: .thick),
    ModelPizza(cost: 1200, viewPizza: .seaFood, dough: .thick),
    ModelPizza(cost: 1350, viewPizza: .seaFood, dough: .thin),
    ModelPizza(cost: 900, viewPizza: .pineapple, dough: .thin),
    ModelPizza(cost: 950, viewPizza: .pineapple, dough: .thick),
])
pizzeria.printPizza()
pizzeria.addPizza(add: ModelPizza(cost: 490, viewPizza: .margarita, dough: .thin))
print(" ")
pizzeria.printPizza()

var myPizza = pizzeria.makeAnOrder(pizza: 9, add: [.cheese, .tomato])
var anotherPizza = pizzeria.makeAnOrder(pizza: 3, add: nil)
print(" ")

pizzeria.takePizza(pizza: myPizza)
pizzeria.takePizza(pizza: anotherPizza)




extension Array {
    var toPrint: String  {
        var str = ""
        for element in self {
            str += "\(element) "
        }
        return str
    }
}

