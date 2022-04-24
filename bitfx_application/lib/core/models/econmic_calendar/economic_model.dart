import 'dart:convert';

class EconomicModel {
  EconomicModel(
      {required this.calendarId,
      required this.date,
      required this.country,
      required this.category,
      required this.event,
      required this.reference,
      required this.source,
      required this.sourceURL,
      required this.actual,
      required this.previous,
      required this.forecast,
      required this.tEForecast,
      required this.uRL,
      required this.dateSpan,
      required this.importance,
      required this.lastUpdate,
      required this.revised,
      required this.currency,
      required this.unit,
      required this.ticker,
      required this.symbol});

  String calendarId;
  DateTime date;
  String country;
  String category;
  String event;
  String reference;
  String source;
  String sourceURL;
  String actual;
  String previous;
  String forecast;
  String tEForecast;
  String uRL;
  String dateSpan;
  int importance;
  DateTime lastUpdate;
  String revised;
  String currency;
  String unit;
  String ticker;
  String symbol;

  factory EconomicModel.fromJson(Map<String, dynamic> json) {
    return EconomicModel(
      calendarId: json['CalendarId'],
      date: DateTime.parse(json['Date']),
      country: json['Country'],
      category: json['Category'],
      event: json['Event'],
      reference: json['Reference'],
      source: json['Source'],
      sourceURL: json['SourceURL'],
      actual: json['Actual'],
      previous: json['Previous'],
      forecast: json['Forecast'],
      tEForecast: json['TEForecast'],
      uRL: json['URL'],
      dateSpan: json['DateSpan'],
      importance: json['Importance'],
      lastUpdate: DateTime.parse(json['LastUpdate']),
      revised: json['Revised'],
      currency: json['Currency'],
      unit: json['Unit'],
      ticker: json['Ticker'],
      symbol: json['Symbol'],
    );
  }

  static List<EconomicModel> fromApi(List<dynamic> resArr) {
    return resArr.map((news) => EconomicModel.fromJson(news)).toList();
  }
}
