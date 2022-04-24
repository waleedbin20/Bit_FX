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
  String result = '';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculatorViewModel>.reactive(
      viewModelBuilder: () => CalculatorViewModel(),
      onModelReady: (viewModel) => viewModel.calulateAccordingToPairs(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: mainCyan,
          title: Center(
              child: Text(
            "FX Calculator",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CalculatorTextBox(
                    controller: viewModel.accBal,
                    text: 'Account Balance',
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  BuildDropDown(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  CalculatorTextBox(
                    controller: viewModel.riskP,
                    text: 'Risk Percent',
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  CalculatorTextBox(
                    controller: viewModel.stoploss,
                    text: 'Stop Loss',
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Button(
                      textValue: "Calculate",
                      onPressed: () {
                        viewModel.calulateAccordingToPairs();
                        viewModel.clearTextInput();
                      }),
                  Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(viewModel.result,
                          style: TextStyle(color: mainCyan, fontSize: 20)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildDropDown extends ViewModelWidget<CalculatorViewModel> {
  @override
  Widget build(BuildContext context, CalculatorViewModel viewModel) {
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
                        child: Container(
                          width: 500,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              menuMaxHeight: 600,
                              isExpanded: true,
                              dropdownColor: Color.fromARGB(255, 208, 255, 249),
                              value: viewModel.dropdownValue,
                              icon: const Icon(
                                Icons.arrow_downward,
                                color: Colors.black,
                              ),
                              iconSize: 10,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? newValue) {
                                viewModel.dropdownValue = newValue!;
                              },
                              items: <String>[
                                'GBP/USD',
                                'EUR/USD',
                                'NZD/USD',
                                'AUD/USD',
                                'XAU/USD',
                                'USD/CAD',
                                'USD/JPY',
                                'USD/CHF',
                                'USD/SGD',
                                'EUR/JPY',
                                'EUR/AUD',
                                'EUR/CAD',
                                'EUR/GBP',
                                'AUD/JPY',
                                'GBP/JPY',
                                'CAD/JPY',
                                'CAD/JPY',
                                'NZD/JPY',
                                'CHF/JPY',
                                'GBP/NZD',
                                'EUR/NZD',
                                'AUD/NZD',
                                'GBP/AUD',
                                'NZD/CAD',
                                'AUD/CAD',
                                'GBP/CAD',
                                'EUR/CHF',
                                'CAD/CHF',
                                'GBP/CHF',
                                'AUD/CHF',
                                'NZD/CHF',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
