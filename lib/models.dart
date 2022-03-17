import 'package:flutter/material.dart';
import 'dart:convert';

class Weather {
  String? city;
  int? temp;
  double? wind;
  int? humidity;
  int? pressure;
  Weather({
    this.city,
    this.temp,
    this.wind,
    this.humidity,
    this.pressure,
  });
  Weather.fromJson(Map<String, dynamic> json) {
    city = json["name"];
    temp = (json["main"]["temp"] - 273.15).round();
    wind = json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
  }
}
