import 'package:http/http.dart' as http;
import 'package:weather_m/models.dart';
import 'dart:convert';

class DataService {
  Future<Weather>? getweather(String? city) async {
    final uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=16a2ac45d1df777e0cf189f1fad17c17");

    final response = await http.get(uri);

    final body = jsonDecode(response.body);
    print(Weather.fromJson(body).city);
    return Weather.fromJson(body);
  }
}
