import Foundation

//1. Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент это годовой процент, третий аргумент это срок Функция возвращает сколько денег получит пользователь по итогу.

func printMoneyFormatter(money: Float) -> String {
    let numberFormatter: NumberFormatter = NumberFormatter()
    numberFormatter.groupingSeparator = " "
    numberFormatter.groupingSize = 3
    numberFormatter.usesGroupingSeparator = true
    numberFormatter.decimalSeparator = "."
    numberFormatter.numberStyle = NumberFormatter.Style.decimal
    numberFormatter.maximumFractionDigits = 2
    guard let stringFromNumber = numberFormatter.string(from: money as NSNumber) as String? else { return "🤑"}
    print(stringFromNumber)
    return stringFromNumber
}

func percentSumMoreYear(money: Float, percent: Float, year: UInt) -> Float {
    var percentFLoat: Float = percent / 100
    var myIncome: Float = money * pow((1 + percentFLoat), Float(year))
    let moneyPrint = printMoneyFormatter(money: money)
    let myIncomePrint = printMoneyFormatter(money: myIncome)
    print("ваш доход с суммы: \(moneyPrint)")
    print("составит: \(myIncomePrint)")
    return myIncome
}

percentSumMoreYear(money: 1000, percent: 10, year: 3)


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
