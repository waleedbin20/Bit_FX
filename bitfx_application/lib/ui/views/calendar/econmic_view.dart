import 'dart:async';
import 'dart:convert';
import 'package:bitfx_application/core/models/econmic_calendar/economic_model.dart';
import 'package:bitfx_application/core/models/econmic_calendar/response.dart';
import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EconomicCalendarView extends StatefulWidget {
  EconomicCalendarView({Key? key}) : super(key: key);

  @override
  State<EconomicCalendarView> createState() => _EconomicCalendarViewState();
}

class _EconomicCalendarViewState extends State<EconomicCalendarView> {
  StreamController<List<EconomicModel>> _streamController =
      StreamController<List<EconomicModel>>();
  late Future<dynamic> futureNews;

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  @override
  void initState() {
    super.initState();
    // after every 3 seconds it will call the forex news
    Timer.periodic(Duration(seconds: 10), (timer) {
      getForexNews();
    });
  }

  Future<Response> getForexNews() async {
    var url = Uri.parse(
        'https://api.tradingeconomics.com/calendar?c=guest:guest&f=json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final parsedRes = EconomicModel.fromApi(jsonDecode(response.body));
      if (!_streamController.isClosed) {
        _streamController.sink.add(parsedRes);
      }

      return Response(message: " ", data: parsedRes);
    } else {
      return Response(message: "Something went wrong while fetching articles");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mainCyan,
        title: Text(
          "Economic Calendar",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: StreamBuilder<List<EconomicModel>>(
          stream: _streamController.stream,
          builder: (context, snapdata) {
            switch (snapdata.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    color: mainCyan,
                  ),
                );
              default:
                if (snapdata.hasError) {
                  return Text("Data fetching");
                } else {
                  return BuildNewsListView(snapdata);
                }
            }
          },
        ),
      ),
    );
  }

  Scaffold BuildNewsListView(AsyncSnapshot<List<EconomicModel>> snapdata) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: ((context, index) => Divider(
                      color: mainCyan,
                      thickness: 1,
                    )),
                itemCount: snapdata.data!.length,
                itemBuilder: (context, news) {
                  return CustomListItemTwo(
                    thumbnail: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            snapdata.data![news].date.day.toString() +
                                "-" +
                                snapdata.data![news].date.month.toString() +
                                "-" +
                                snapdata.data![news].date.year.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 129, 168, 188),
                                fontSize: 12),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            snapdata.data![news].date.timeZoneName.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 129, 168, 188)),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            snapdata.data![news].date.hour.toString() +
                                ":" +
                                snapdata.data![news].date.minute.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 129, 168, 188)),
                          ),
                        ),
                      ],
                    ),
                    country: snapdata.data![news].country,
                    category: snapdata.data![news].category,
                    author: snapdata.data![news].symbol,
                    forecast: snapdata.data![news].forecast,
                    previous: snapdata.data![news].previous,
                    actual: snapdata.data![news].actual,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo(
      {Key? key,
      required this.thumbnail,
      required this.country,
      required this.category,
      required this.author,
      required this.forecast,
      required this.previous,
      required this.actual})
      : super(key: key);

  final Widget thumbnail;
  final String country;
  final String category;
  final String author;
  final String actual;
  final String previous;
  final String forecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      child: SizedBox(
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            VerticalDivider(
              width: 20,
              thickness: 1.5,
              indent: 2,
              endIndent: 0,
              color: Color.fromARGB(255, 114, 113, 113),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  country: country,
                  category: category,
                  author: author,
                  actual: actual,
                  previous: previous,
                  forecast: forecast,
                ),
              ),
            ),
            VerticalDivider(
              width: 20,
              thickness: 5,
              color: Color.fromARGB(255, 56, 175, 230),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    Key? key,
    required this.country,
    required this.category,
    required this.author,
    required this.actual,
    required this.previous,
    required this.forecast,
  }) : super(key: key);

  final String country;
  final String category;
  final String author;
  final String actual;
  final String previous;
  final String forecast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                country,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 11.5),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 3.0)),
              Text(
                category,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                author,
                style: const TextStyle(
                  fontSize: 11.0,
                  color: Colors.lightBlue,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                "Act: ${actual} | Fore: ${forecast} | Prev: ${previous} ",
                style: const TextStyle(
                  fontSize: 11.0,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
