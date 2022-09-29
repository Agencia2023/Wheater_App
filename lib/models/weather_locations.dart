import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pronostico/provider/wheater.provider.dart';

class Weather {
  String? cityName;
  String? main;
  double? temp;
  double? wind;
  int? rain;
  int? humidity;
  double? feels_like;
  int? pressure;
  int? dt;
  String? icon;

  Weather(
      {this.cityName,
      this.main,
      this.temp,
      this.wind,
      this.rain,
      this.humidity,
      this.feels_like,
      this.pressure,
      this.dt,
      this.icon});

  //functiion
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    main = json["weather"][0]["main"];
    icon = json["weather"][0]["icon"];
    temp = json["main"]["temp"];
    wind = json["main"]["temp_max"];
    rain = json["clouds"]["all"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
    dt = json["dt"];
  }
}
