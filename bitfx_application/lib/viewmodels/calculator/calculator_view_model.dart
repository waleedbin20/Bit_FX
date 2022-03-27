import 'package:flutter/material.dart';

class CalculatorViewModel extends ChangeNotifier {
  TextEditingController accBal = TextEditingController();

  TextEditingController riskP = TextEditingController();
  TextEditingController stoploss = TextEditingController();

  
  double _rslt = 0;
  String _result = '';
  String get result => _result;

  void calculate() {
    double? x = double.tryParse(accBal.text) ?? 0;
    double? y = double.tryParse(riskP.text) ?? 0;
    double? z = double.tryParse(stoploss.text) ?? 0;
    double r = y * 0.01;
    _rslt = (x * r / z) / 10;
    _result = ('Lot Size: ' + _rslt.toStringAsFixed(2));
    notifyListeners();
  }

  clearTextInput(){
 
    accBal.clear();
    riskP.clear();
    stoploss.clear();
 
  }
}
