

//Написать функцию, которая будет решать квадратное уравнение. На вход функция получает коэффициенты a, b, c, d (ax^2 + bx+ c = d), а возвращает корни уравнения.
//func square(_ a: Double, _ b: Double, _ c: Double, _ d: Double) -> (Double?, Double?) {
//    let final = c - d
//    let disc = b * b - 4 * a * final
//    if disc > 0 {
//        return (-b + sqrt(disc) / 2 * a), (-b - sqrt(disc) / 2 * a)
//    } else if disc < 0 {
//        return (nil, nil)
//    } else {
//        return ((-b + sqrt(disc)) / 2 * a), nil)
//    }
//}

//Создать перечисление с видами чая (black, fruit, green), далее создать структуру, в которой будет хранится вид чая и его стоимость. Добавить в структуру чая функцию getCost, которая будет возвращать стоимость чая. На вход функция принимает процент скидки (только целое число), который необходимо применить к стоимости. Если скидка больше 50% напечатать в консоль о невозможности применить скидку и вернуть изначальную стоимость чая.


struct Tea {
    
    enum TeaType {
        case black
        case fruit
        case green
    }
    
    let type: TeaType
    private let cost: Double
    
    func getCost(discount: Int) -> Double {
        guard discount <= 50 else {
            print("Нельзя получить скидку")
            return cost
        }
        return cost * (Double(discount) / 100)
    }
    
    init(type: TeaType, cost: Double) {
        self.type = type
        self.cost = cost
    }
}

//Создать класс Cafe, в котором хранится массив с чаем. Переменная с массивом должна быть приватной. Значение в массив должно устанавливаться в инициализаторе Добавить в класс функцию, которая на вход принимает тип чая и скидку, которую нужно применить. Функция должна вернуть стоимость, которую должен заплатить покупатель. Если данного вида чая нет в массиве(меню) - вернуть nil.
    
class Cafe {
    private var tea: [Tea]
    
    init(tea: [Tea]) {
        self.tea = tea
    }
    
    func getCost(type: Tea.TeaType, discount: Int) -> Double? {
        guard let tea = self.tea.first(where: { $0.type == type }) else { return nil }
        return tea.getCost(discount: discount)
    }
    
    func availableTea(activity: Person.Activity.TypeOfActivity, ammount: Double, discount: Int) -> Tea? {
        var result = [Tea]()
        switch activity {
        case .pupil:
            result = tea.filter{($0.getCost(discount: discount) <= ammount)}
        case .employee:
            result = tea.filter({ $0.getCost(discount: discount) <= ammount && ($0.type == .black || $0.type == .fruit) })
        case .student:
            result = tea.filter({ $0.getCost(discount: discount) <= ammount && $0.type == .black })
        }
        return result.sorted{$0.getCost(discount: discount) > $1.getCost(discount: discount)}.first
    }
}

//Сделать так, чтобы в структуре чая можно было получить стоимость только через функцию getCost, то есть чтобы извне функции не было доступа к переменной со стоимостью чая.

//Создать класс Person, внутри которого должна быть структура Activity, внутри которой должно быть перечисление TypeOfActivity (тип активности) с тремя кейсами: pupil, student, employee. Создать переменную и явно указать ей тип “тип активности”.

class Person {
    struct Activity {
        enum TypeOfActivity {
        case pupil, student, employee
        }
    }
}

let activity = Person.Activity.TypeOfActivity.employee


//Добавить в класс Cafe функцию, которая на основе типа активности, предложенной суммы и возможной скидки возвращает доступный чая. Чай выбирается по следующим критериям: если это pupil, то доступен и черный, и зеленый, и фруктовый чай. Если это student, то только черный, а если employee, то черный и фруктовый. Если предложенной суммы хватает на все доступные виды чая, то вернуть самый дорогой. Если суммы хватает только на один, то вернуть его. Если суммы хватает на несколько доступных  видов чая, но у них одинаковая стоимость, то вернуть любой из них. Если суммы не хватает ни на один вид чая, то вернуть nil.
