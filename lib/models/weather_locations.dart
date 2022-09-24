import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pronostico/provider/wheater.provider.dart';

class WeatherLocation {
  String city;
  String dateTime;
  String temparature;
  String weatherType;
  String iconUrl;
  int wind;
  int rain;
  int humidity;
  WeatherLocation({
    required this.city,
    required this.dateTime,
    required this.temparature,
    required this.weatherType,
    required this.iconUrl,
    required this.wind,
    required this.rain,
    required this.humidity,
  });
  factory WeatherLocation.fromJson(Map<String, dynamic> json) {
    return WeatherLocation(
      city: json["location"]["name"] ?? '',
      dateTime: json["location"]["localtime"] ?? '',
      temparature: json["current"]["temp_c"] ?? '',
      weatherType: json["current"]["condition"]["text"] ?? '',
      iconUrl: json["current"]["condition"]["icon"] ?? '',
      wind: json["current"]["wind_kph"] ?? '',
      rain: json["current"]["precip_in"],
      humidity: json["current"]["humidity"],
    );
  }
}
/*
class WeatherLocation {
  final String city;
  final String dateTime;
  final String temparature;
  final String weatherType;
  final String iconUrl;
  final int wind;
  final int rain;
  final int humidity;

  WeatherLocation({
    required this.city,
    required this.dateTime,
    required this.temparature,
    required this.weatherType,
    required this.iconUrl,
    required this.wind,
    required this.rain,
    required this.humidity,
  });
}
*/

final locationList = [
  WeatherLocation(
    city: "Villavicencio",
    dateTime: '07:50 PM — Lunes, 23 Sep 2022',
    temparature: '24\u00B0',
    weatherType: 'Night',
    iconUrl: 'assets/moon.svg',
    wind: 10,
    rain: 2,
    humidity: 10,
  ),
  WeatherLocation(
    city: 'Bogota',
    dateTime: '07:50 PM — Lunes, 23 Sep 2022',
    temparature: '15\u00B0',
    weatherType: 'Cloudy',
    iconUrl: 'assets/cloudy.svg',
    wind: 8,
    rain: 7,
    humidity: 82,
  ),
  WeatherLocation(
    city: 'Medellin',
    dateTime: '07:50 PM — Lunes, 23 Sep 2022',
    temparature: '17\u00B0',
    weatherType: 'Sunny',
    iconUrl: 'assets/sun.svg',
    wind: 5,
    rain: 15,
    humidity: 61,
  ),
  WeatherLocation(
    city: 'Cartagena',
    dateTime: '07:50 PM — Lunes, 23 Sep 2022',
    temparature: '10\u00B0',
    weatherType: 'Rainy',
    iconUrl: 'assets/rain.svg',
    wind: 20,
    rain: 70,
    humidity: 91,
  ),
];
