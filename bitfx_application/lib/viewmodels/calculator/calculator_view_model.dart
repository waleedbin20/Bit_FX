import 'package:flutter/material.dart';

class CalculatorViewModel extends ChangeNotifier {
  TextEditingController accBal = TextEditingController();

  TextEditingController riskP = TextEditingController();
  TextEditingController stoploss = TextEditingController();

  double _rslt = 0;

  String _result = '';

  String get result => _result;

  String _dropdownValue = 'GBP/USD';

  String get dropdownValue => _dropdownValue;

  set dropdownValue(String value) {
    _dropdownValue = value;
    notifyListeners();
  }

  void calculate(int pipSize) {
    double? x = double.tryParse(accBal.text) ?? 0;
    double? y = double.tryParse(riskP.text) ?? 0;
    double? z = double.tryParse(stoploss.text) ?? 0;
    double r = y * 0.01;
    _rslt = (x * r / z) / pipSize;
    _result = ('Lot Size: ' + _rslt.toStringAsFixed(2));
    notifyListeners();
  }

  void calulateAccordingToPairs() {
    var forexPair = dropdownValue;
    switch (forexPair) {
      case 'EUR/USD':
      case 'GBP/USD':
      case 'NZD/USD':
      case 'AUD/USD':
        {
          calculate(10);
        }
        break;
      case 'XAU/USD':
        {
          calculate(10);
        }
        break;
      case 'GBP/JPY':
      case 'USD/JPY':
      case 'EUR/JPY':
      case 'AUD/JPY':
      case 'CAD/JPY':
      case 'NZD/JPY':
      case 'CHF/JPY':
        {
          calculate(1000);
        }
        break;
      case 'USD/CAD':
      case 'NZD/CAD':
      case 'AUD/CAD':
      case 'GBP/CAD':
      case 'EUR/CAD':
        {
          calculate(10);
        }
        break;
      case 'USD/CHF':
      case 'EUR/CHF':
      case 'CAD/CHF':
      case 'GBP/CHF':
      case 'AUD/CHF':
      case 'NZD/CHF':
        {
          calculate(10);
        }
        break;
      case 'GBP/AUD':
      case 'EUR/AUD':
        {
          calculate(10);
        }
        break;
      case 'GBP/NZD':
      case 'EUR/NZD':
      case 'AUD/NZD':
        {
          calculate(10);
        }
        break;
      case 'EUR/GBP':
      case 'USD/SGD':
        {
          calculate(10);
        }
        break;

      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }

  clearTextInput() {
    accBal.clear();
    riskP.clear();
    stoploss.clear();
  }
}
