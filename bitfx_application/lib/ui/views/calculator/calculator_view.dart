import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:bitfx_application/ui/widgets/button.dart';
import 'package:bitfx_application/ui/widgets/calculator_textbox.dart';
import 'package:bitfx_application/viewmodels/calculator/calculator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  TextEditingController _accBal = TextEditingController();

  TextEditingController _risk = TextEditingController();
  TextEditingController _stoploss = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainGrey,
            title: Center(
                child: Text(
              "FX Calculator",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: mainCyan),
            )),
            automaticallyImplyLeading: false,
          ),
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.black),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      CalculatorTextBox(
                        controller: _accBal,
                        text: 'Account Balance',
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      MyStatefulWidget(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      CalculatorTextBox(
                        controller: _risk,
                        text: 'Risk Percent',
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      CalculatorTextBox(
                        controller: _stoploss,
                        text: 'Stop Loss',
                      ),

                      Text("Lot Size: "),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Button(textValue: "Calculate", onPressed: () {



                      })
                    ],
                  ),
                ),
              ))),
    );
  }
}

//DropDown Box for Forex Pair
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'EURUSD';

  @override
  Widget build(BuildContext context) {
    return CurrencyPair(context);
  }

  Container CurrencyPair(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: FittedBox(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: mainCyan,
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.attach_money_outlined,
                  size: 30,
                ),
                Text("Select Pair",
                    style: TextStyle(
                        fontSize: 20.0,
                        height: 1.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 40),
                Row(
                  children: [
                    Container(
                      width: 70.0,
                      height: 30,
                      child: SizedBox(
                        child: DropdownButton<String>(
                          menuMaxHeight: 600,
                          isExpanded: true,
                          dropdownColor: Color.fromARGB(255, 208, 255, 249),
                          value: dropdownValue,
                          icon: const Icon(
                            Icons.arrow_downward,
                            color: Colors.black,
                          ),
                          iconSize: 10,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              
                            });
                          },
                          items: <String>[
                            'EURUSD',
                            'GBPUSD',
                            'NZDUSD',
                            'XAUUSD',
                            'GBPJPY',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        
                      ),
                      
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ));
  }


}
