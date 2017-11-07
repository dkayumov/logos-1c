﻿//////////////////////////////////////////////////////////////////////////
//
// LOGOS: реализация логирования в стиле log4j для OneScript
//
//////////////////////////////////////////////////////////////////////////

#Область УровниЛога

Перем мУровниПриоритета;
Перем мНаименованиеУровней;

Перем Отладка Экспорт;
Перем Информация Экспорт;
Перем Предупреждение Экспорт;
Перем Ошибка Экспорт;
Перем КритичнаяОшибка Экспорт;
Перем Отключить Экспорт;

#КонецОбласти

#Область Логирование

//Перем мТекущийУровень;
//Перем мСпособыВывода;
//Перем мСпособВыводаЗаданВручную;

//Перем мИдентификатор;
//Перем мРаскладкаСообщения;


Функция Уровень() Экспорт
	Возврат мТекущийУровень;
КонецФункции

Процедура УстановитьУровень(Знач Уровень) Экспорт
	Если Уровень < 0 или Уровень > УровниЛога.Отключить Тогда
		ВызватьИсключение "Неверное значение аргумента 'Уровень'";
	КонецЕсли;

	мТекущийУровень = Уровень;

КонецПроцедуры

Процедура УстановитьРаскладку(Знач Раскладка) Экспорт
	мРаскладкаСообщения = Раскладка;
КонецПроцедуры

Процедура Закрыть() Экспорт
	Для Каждого СпособВывода Из мСпособыВывода Цикл
		СпособВывода.Закрыть();
	КонецЦикла;
	мСпособыВывода.Очистить();
КонецПроцедуры

Процедура ДобавитьСпособВывода(Знач СпособВывода) Экспорт

	Если Не мСпособВыводаЗаданВручную Тогда
		Закрыть();
		мСпособВыводаЗаданВручную = Истина;
	КонецЕсли;

	мСпособыВывода.Добавить(СпособВывода);

КонецПроцедуры

Процедура УдалитьСпособВывода(Знач СпособВывода) Экспорт

	Для Сч = 0 По мСпособыВывода.Количество()-1 Цикл
		Если мСпособыВывода[Сч] = СпособВывода Тогда
			СпособВывода.Закрыть();
			мСпособыВывода.Удалить(Сч);
			Прервать;
		КонецЕсли;
	КонецЦикла;

КонецПроцедуры

Функция ПолучитьИдентификатор() Экспорт
	Возврат мИдентификатор;
КонецФункции

Процедура Отладка(Знач Сообщение,
		Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
		Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
		Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт

	Вывести(Сообщение, УровниЛога.Отладка, Параметр1,
		Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);
КонецПроцедуры

Процедура Информация(Знач Сообщение,
		Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
		Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
		Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт

	Вывести(Сообщение, УровниЛога.Информация, Параметр1,
		Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);

КонецПроцедуры

Процедура _Предупреждение(Знач Сообщение,
		Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
		Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
		Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт

	Вывести(Сообщение, УровниЛога.Предупреждение, Параметр1,
		Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);

КонецПроцедуры

Процедура Ошибка(Знач Сообщение,
		Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
		Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
		Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт

	Вывести(Сообщение, УровниЛога.Ошибка, Параметр1,
		Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);

КонецПроцедуры

Процедура КритичнаяОшибка(Знач Сообщение,
		Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
		Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
		Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт

	Вывести(Сообщение, УровниЛога.КритичнаяОшибка, Параметр1,
		Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);

КонецПроцедуры

Процедура Вывести(Знач Сообщение, Знач УровеньСообщения,
		Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
		Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
		Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт

	// TODO когда решится баг https://github.com/EvilBeaver/oscript-library/pull/110
	 Если Параметр1 <> Неопределено Тогда
	 	Сообщение = СтрШаблон(Сообщение, Параметр1,
	 		Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);
	 КонецЕсли;

	Если УровеньСообщения >= Уровень() Тогда
		Для Каждого СпособВывода Из мСпособыВывода Цикл
			СпособВывода.Вывести(мРаскладкаСообщения.Форматировать(УровеньСообщения, Сообщение));
		КонецЦикла;
	КонецЕсли

КонецПроцедуры

Процедура Инициализация()

	ЗаполнитьУровниЛога();
	
	ИнициализироватьУровни();
	ИнициализироватьНаименованияУровней();
	
	УстановитьУровень(УровниЛога.Информация);
	ИнициализироватьСпособыВывода();
	мИдентификатор = Новый УникальныйИдентификатор;

КонецПроцедуры

Процедура ЗаполнитьУровниЛога()
	Если Не ЗначениеЗаполнено(УровниЛога) Тогда
		УровниЛога = Новый Структура;
		УровниЛога.Вставить("Отладка"        , 0);
		УровниЛога.Вставить("Информация"     , 1);
		УровниЛога.Вставить("Предупреждение" , 2);
		УровниЛога.Вставить("Ошибка"         , 3);
		УровниЛога.Вставить("КритичнаяОшибка", 4);
		УровниЛога.Вставить("Отключить"      , 5);
		
		УровниЛога = Новый ФиксированнаяСтруктура(УровниЛога);
	КонецЕсли;
КонецПроцедуры

Процедура ИнициализироватьСпособыВывода()

	мРаскладкаСообщения = ЭтотОбъект; //Новый ОсновнаяРаскладкаСообщения;

	мСпособВыводаЗаданВручную = Ложь;
	мСпособыВывода = Новый Массив;

	ВыводПоУмолчанию = Обработки.ВыводЛогаВКонсольЛог.Создать(); //Новый ВыводЛогаВКонсоль();
	мСпособыВывода.Добавить(ВыводПоУмолчанию);
	
	ВыводПоУмолчанию = Обработки.ВыводЛогаВЖРЛог.Создать();
	мСпособыВывода.Добавить(ВыводПоУмолчанию);

КонецПроцедуры

#КонецОбласти

#Область УровниЛога

//////////////////////////////////////////////////////////////////////////////////

Функция НаименованиеУровня(Знач Уровень) Экспорт
	Возврат мНаименованиеУровней[Уровень];
КонецФункции


//////////////////////////////////////////////////////////////////////////////////
// СЛУЖЕБНЫЕ ПРОЦЕДУРЫ
//

//Процедура Инициализация()
//	
//	ИнициализироватьУровни();
//	ИнициализироватьНаименованияУровней();
//	
//КонецПроцедуры

Процедура ИнициализироватьУровни()
	
	мУровниПриоритета = Новый Структура;
	мУровниПриоритета.Вставить("Отладка"        , 0);
	мУровниПриоритета.Вставить("Информация"     , 1);
	мУровниПриоритета.Вставить("Предупреждение" , 2);
	мУровниПриоритета.Вставить("Ошибка"         , 3);
	мУровниПриоритета.Вставить("КритичнаяОшибка", 4);
	мУровниПриоритета.Вставить("Отключить"      , 5);
	
	мТекущийУровень = мУровниПриоритета.Информация;
	
	Для Каждого КлючИЗначение Из мУровниПриоритета Цикл
		//ЭтотОбъект[КлючИЗначение.Ключ] = КлючИЗначение.Значение;
		Выполнить(СтрШаблон("%1 = %2;", КлючИЗначение.Ключ, КлючИЗначение.Значение));
	КонецЦикла;
	
КонецПроцедуры

Процедура ИнициализироватьНаименованияУровней()
	
	мНаименованиеУровней = Новый Соответствие;
	мНаименованиеУровней.Вставить(мУровниПриоритета.Отладка        , "ОТЛАДКА");
	мНаименованиеУровней.Вставить(мУровниПриоритета.Информация     , "ИНФОРМАЦИЯ");
	мНаименованиеУровней.Вставить(мУровниПриоритета.Предупреждение , "ПРЕДУПРЕЖДЕНИЕ");
	мНаименованиеУровней.Вставить(мУровниПриоритета.Ошибка         , "ОШИБКА");
	мНаименованиеУровней.Вставить(мУровниПриоритета.КритичнаяОшибка, "КРИТИЧНАЯОШИБКА");
	мНаименованиеУровней.Вставить(мУровниПриоритета.Отключить      , "ОТКЛЮЧИТЬ");

КонецПроцедуры

//Инициализация();

#КонецОбласти

#Область ОсновнаяРаскладкаСообщения

Функция Форматировать(Знач Уровень, Знач Сообщение) Экспорт
	
	Возврат СтрШаблон("%1 - %2", НаименованиеУровня(Уровень), Сообщение);
	//Возврат СтрШаблон("%1 - %2", УровниЛога.НаименованиеУровня(Уровень), Сообщение);
	
КонецФункции

#КонецОбласти

Инициализация();
