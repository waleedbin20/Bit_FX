class CalculatorViewModel {

  final String pairName;
  final double accountBalance;
  final double risk;
  final double stopLoss;

 
  CalculatorViewModel(this.pairName, this.accountBalance, this.risk, this.stopLoss,);

    ForexCalculation() {    

    int lotSize = 0;

    switch (pairName) {
      case 'EURUSD':
        return "${lotSize + 4}";

      case 'GBPUSD':
        return "${lotSize + 5}";

      case 'NZDUSD':
        return "${lotSize + 6}";

      default:
        return lotSize;
    }
  }
 
  


}