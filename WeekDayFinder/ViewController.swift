//
//  ViewController.swift
//  WeekDayFinder
//
//  Created by  Paul on 01.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
// прописываем аутлеты (ссылки), связывая элементы интерфейса с кодом
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
// экшн - для связывания кнопки с функционалом в коде
    @IBAction func findDay() {
        
// определение типа календаря для формирования даты
        let calendar = Calendar.current
        
// выбор компонентов, составляющих дату, из класса DateComponents
        var dateComponents = DateComponents()

// guard проверяет на наличие значения (если !nil - код исполняется дальше)
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)

// создаем нашу дату из созданных компонентов
        guard let date = calendar.date(from: dateComponents) else { return }

// форматируем дату (+ перевод дня недели в РУ), используя класс DateFormatter
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "EEEE"

// определяем наш день недели (+ первую букву в верхний регистр)
        let weekDay = dateFormatter.string(from: date)
        let capitalizedWeekDay = weekDay.capitalized

// вывод результата в лейбл
        resultLabel.text = capitalizedWeekDay
    }

// метод для сворачивания клавиатуры при нажатии на пустое место экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

