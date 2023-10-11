import Foundation

//1. Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент это годовой процент, третий аргумент это срок Функция возвращает сколько денег получит пользователь по итогу.

func howMuchmoney(money: Float, percent: Float) -> Float {
    var myIncome: Float = money / 100 * percent
    print("ваш доход с суммы:"); printMoney(money: money)
    print("под процент: \(percent)%")
    print("составит:"); printMoney(money: myIncome)
    myIncome += money
    print("Итоговая сумма:")
    printMoney(money: myIncome)
    return myIncome
}
func printMoney(money: Float) {
    let numberFormatter: NumberFormatter = NumberFormatter()
    numberFormatter.groupingSeparator = " "
    numberFormatter.groupingSize = 3
    numberFormatter.usesGroupingSeparator = true
    numberFormatter.decimalSeparator = "."
    numberFormatter.numberStyle = NumberFormatter.Style.decimal
    guard let stringFromNumber = numberFormatter.string(from: money as NSNumber) as String? else { return }
    print(stringFromNumber)
}
howMuchmoney(money: 1300000, percent: 9.7)

//2. Создать перечисление, которое содержит 3 вида пиццы и создать переменные с каждым видом пиццы.
enum PizzaView: String {
    case pepperoni = "пепперони"
    case cheese = "сырная"
    case seaFood = "с морепродуктами"
}

var pepperoni = PizzaView.pepperoni
var cheese = PizzaView.cheese
var seaFood = PizzaView.seaFood

//3. Добавить возможность получения названия пиццы через rawValue
print("Пицца '\(pepperoni.rawValue)' есть в наличии.")
print("Пицца '\(cheese.rawValue)' будет готова через 15 минут.")
print("Пицца '\(seaFood.rawValue)' закончилась.")
