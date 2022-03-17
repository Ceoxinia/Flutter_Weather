import 'package:flutter/material.dart';
import 'package:weather_m/additional_info_container.dart';
import 'package:weather_m/models.dart';
import 'package:weather_m/data_service.dart';
import 'package:weather_m/weather_column.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final data_service = DataService();
  final textController = TextEditingController();
  late Weather? _response = null;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.topLeft,
          colors: [
            Color(0XFF0066FF),
            Color(0XFF00C2FF),
            Color(0XFF0066FF),
          ],
        )
            
            ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Image.asset('assets/snow.png'),
            title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: getData,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          /* Clear the search field */
                        },
                      ),
                      hintText: 'Your location...',
                      border: InputBorder.none),
                ),
              ),
            ),
           
          ),
          body: Column(children: <Widget>[
            if (_response != null)
              Container(
                  child: weather_column("assets/Asset1.png",
                      "${_response!.temp}°", "${_response!.city}")),
            if (_response != null)
              Container(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      add_info_cont('humidity', 'assets/humidity.png',
                          "${_response!.humidity}%"),
                      add_info_cont('rain', 'assets/umbrella.png',
                          "${_response!.pressure}"),
                      add_info_cont(
                          'wind', 'assets/wind.png', "${_response!.wind}km/h"),
                    ]),
              ),
            Text('Locations you have checked earlier',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Container(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: <Widget>[
                      add_info_cont('windy', 'assets/snow.png', '10'),
                      add_info_cont('cold', 'assets/snow.png', '10'),
                      add_info_cont('rainy', 'assets/snow.png', '10'),
                      add_info_cont('cold', 'assets/snow.png', '10'),
                    ]))),
          ]),
        ));
  }

  void getData() async {
    final response = await data_service.getweather(textController.text);
    setState(() {
      _response = response;
    });
  }
}
