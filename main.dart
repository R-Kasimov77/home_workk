import 'dart:io';

void main(List<String> args) {
  List<Currency> currencies = [];
  Currency usd =
      Currency(currencyName: "Доллар", value: 84.5, currencyShortName: "USD");
  Currency euro = Currency(
      currencyName: "Евро", value: 101.1113, currencyShortName: "EURO");
  Currency rub =
      Currency(currencyName: "Рубль", value: 1.1438, currencyShortName: "RUB");
  Currency ten =
      Currency(currencyName: "Тенге", value: 0.2014, currencyShortName: "KZT");
  currencies.add(usd);
  currencies.add(euro);
  currencies.add(rub);
  currencies.add(ten);

  var changeMethod = ''; //Сюда мы записываем сом на валюту или валюту на сом
  var chosenCurrencyShortName = ''; // Имя выбранной нами валюты
  var chosenCurrencyValue = 0.0; // Курс выбранной нами валюты
  var result = 0.0; // Сюда мы записываем резульат конвертации
  var changeCurrencySum = ''; // Сюда мы записываем чсло сколько хотим поменять

  print("Курс на сегодня: ");
  for (var i = 0; i < currencies.length; i++) {
    print("${currencies[i].currencyName} ${currencies[i].value} сом");
  }
  print("\n\n");
  print("1) Хотите обменять другую валюту на сом");
  print("2) Хотите обменять сом на другую валюту");
  stdout.write("Ввод: ");
  changeMethod = stdin.readLineSync() ?? '';
  print("Выберите валюту:");
  for (var i = 0; i < currencies.length; i++) {
    print("${currencies[i].currencyShortName}");
  }
  stdout.write("Ввод:");
  chosenCurrencyShortName = stdin.readLineSync() ?? '';
  for (var i = 0; i < currencies.length; i++) {
    if (chosenCurrencyShortName.toUpperCase() ==
        currencies[i].currencyShortName) {
      chosenCurrencyValue = currencies[i].value;
      if(changeMethod.trim()=="1".trim()){
        print('Сколько сом Вы хотите купить?');
      }else if(changeMethod.trim()=="2".trim()){
          print('Сколько ${currencies[i].currencyName} Вы хотите купить?');
      }
      
    }
  }
  stdout.write('Ввод:');
  changeCurrencySum = stdin.readLineSync()??'';

  if(changeMethod.trim() == '1'.trim()){
    result = otherCurrencyToSom(chosenCurrencyValue, double.tryParse(changeCurrencySum)??0);
    print("Обмен $result $chosenCurrencyShortName на $changeCurrencySum сом");
  }else if(changeMethod.trim() == "2".trim()){
    result = somToOtherCurrency(chosenCurrencyValue, double.tryParse(changeCurrencySum) ?? 0);
     print("Обмен $result сом на $changeCurrencySum $chosenCurrencyShortName");
  }
  
}
double somToOtherCurrency(double value, double som) {
    return som * value;
  }

  double otherCurrencyToSom(double value, double otherCurrency) {
    return otherCurrency / value;
  }
class Currency {
  final String currencyName;
  final double value;
  final String currencyShortName;

  Currency(
      {this.currencyName = '', this.value = 0.0, this.currencyShortName = ''});
}
