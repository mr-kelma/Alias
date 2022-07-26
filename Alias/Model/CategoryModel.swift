//
//  CategoryModel.swift
//  Alias
//
//  Created by Valery Keplin on 27.07.22.
//

import Foundation


//4 categories: nature, sport, geogr, liter
struct Category {
    let name: String
    let words: [String]
    
    init(name: String, words: [String]) {
        self.name = name
        self.words = words
    }

    static let nature = Category(name: "Природа", words: ["Гриб","Град","Солнце","Луна","Цунами","Землятресение","Лето","Весна","Осень","Зима","Мороз","Жара","Ураган","Молния","Радуга","Рыба","Воробей","Буря","Гром","Гроза","Солнце","Молния","Туман","Снегопад","Шторм","Цветок","Дерево","Растение","Роса","Дождь","Облако","Минерал","Почва","Водоросли","Насекомые","Бабочка","Беспозвоночные","Лягушка","Снежинка","Черви","Медведь","Волк","Заяц","Лиса","Сорока","Дятел","Змея","Комар","Бабочка","Олень","Хорек","Утка","Медуза","Кит","Моллюск","Коралл","Пиранья","Акула","Карп","Краб","Дельфин"])
    
    static let sport = Category(name: "Спорт", words: ["Бейсбол","Баскетбол","Футбол","Волейбол","Крикет","Гребля","Верховая езда","Хоккей","Хоккей на траве","Кросс","Метание диска","Прыжки в высоту","Метание копья","Прыжки в длину","Спринт","Прыжки в воду","Серфинг","Плавание","Виндсерфинг","Биатлон","Бобслей","Керлинг","Фигурное катание","Фристайл","Санный спорт","Скелетон","Слалом","Катание на сноуборде","Скоростной бег на коньках","Бейсджампинг","Дельтапланеризм","Мотофристайл","Скалолазание","Скайсерфинг","Аэробика","Стрельба из лука","Спортивная гимнастика","Бадминтон","Бильярд","Боулинг","Бокс","Марафон","Гонки","Шахматы","Велоспорт","Фехтование","Гольф","Гандбол","Дзюдо","Карате","Альпинизм","Поло","Сквош","Триатлон","Борьба","Скейтбординг","Пеший туризм","Пляжный волейбол","Парашютный спорт","Лошадиные бега","Верховая езда"])
    
    static let geo = Category(name: "География", words: ["Ландшафт","Атлас","Течение","Ветер","Бухта","Залив","Страна","Область","Мыс","Скала","Ущелье","Пик","Вершина","Плато","Архипелаг","Экватор","Широта","Лес","Остров","Гора","Пустыня","Пещера","Вулкан","Прилив","Айсберг","Море","Океан","Болото","Долгота","Меридиан","Оазис","Родник","Координаты","Континент","Волна","Ручей","Отлив","Песок","Полуостров","Луг","Равнина","Ледник","Каньон","Устье","Пожар","Атлас","Климат","Карта","Тропа","Река","Озеро","Утес","Наводнение","Джунгли","Материк","Циклон","Вихрь","Водопад","Гавань","Тундра","Дюна"])

    static let liter = Category(name: "Литература", words: ["Аббревиатура","Ямб","Фентези","Эпитет","Трагедия","Сюжет","Рифма","Хроника","Рецензия","Протагонист","Омоним","Абзац","Монолог","Сонет","Утопия","Тропы","Куплет","Цензура","Критик","Интерлюдия","Заглавие","Жанр","Лексика","Идиома","Кульминация","Притча","Катехизис","Введение","Комедия","Пьеса","Автор","Публицистика","Оксюморон","Развязка","Мотив","Лирика","Конфликт","Драма","Гипербола","Биография","Содержание","Детектив","Пролог","Глава","Фабула","Вокабула","Контекст","Сатира","Проза","Действие","Дилогия","Синопсис","Том","Катрен","Басня","Адаптация","Каламбур","Бестиарий","Эпопея","Гипербатон","Поэма"])
}
