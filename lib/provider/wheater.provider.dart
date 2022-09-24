import 'package:pronostico/models/weather_locations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WheaterProvider {
  Future<List<WeatherLocation>> ObtenerWheater() async {
    List<WeatherLocation> wheater = [];
    var client = http.Client();

    try {
      Map<String, String> parametros = {
        'q': 'Bogota',
      };

      Map<String, String> cabecera = {
        'X-RapidAPI-Key': 'c61f77fc38msh0c9e7dccefe0f0fp161d5djsn36d626bd815a',
        'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com',
      };

      var url = Uri.https(
          'weatherapi-com.p.rapidapi.com', 'current.json', parametros);
      var response = await http.get(url, headers: cabecera);
      print("object");
      var decodeResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      print(utf8.decode(response.bodyBytes));
      decodeResponse['items']
          .forEach((item) => wheater.add(WeatherLocation.fromJson(item)));

      return wheater;
    } finally {
      client.close();
    }
  }
}
