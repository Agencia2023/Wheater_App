import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/weather_locations.dart';
import '../provider/wheater.provider.dart';
import '../screens/wheater.screen.dart';
import '../widgets/additional_information.dart';
import '../widgets/current_weather.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WheaterProvider client = WheaterProvider();
  Weather? data;

  var coloricon;
  String bgImg = ('');
  Future<void> getData() async {
    data = await client.ObtenerWheater("Bogota");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 30,
              color: coloricon,
            ),
          ),
          actions: <Widget>[
            new IconButton(
              onPressed: () => debugPrint("menu"),
              icon: new Icon(Icons.menu),
            ),
          ],
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final timestamp1 = data!.dt; // timestamp in seconds
              final DateTime date1 =
                  DateTime.fromMillisecondsSinceEpoch(timestamp1! * 1000);
              print(data!.wind);
              if (data!.main == 'Sunny') {
                bgImg = 'assets/dia_soleado.jpg';
                coloricon = Colors.black;
              } else if (data!.main == 'Night') {
                bgImg = 'assets/noche_despejada.jpg';
                coloricon = Colors.white;
              } else if (data!.main == "Rain") {
                bgImg = 'assets/dia_lluvia.jpg';
                coloricon = Colors.black;
              } else if (data!.main == 'Clouds') {
                bgImg = 'assets/dia_nubes.jpg';
                coloricon = Colors.black;
              }

              return Stack(
                children: [
                  Image.asset(
                    bgImg,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),

                  //adi
                  additionalInformation(
                      "${data!.cityName}",
                      "${data!.main}",
                      "${data!.temp}",
                      "${data!.wind}",
                      "${data!.rain}",
                      "${data!.dt}",
                      "${data!.humidity}",
                      "${data!.pressure}",
                      "${data!.feels_like}"),

                  //uidone

                  Container(
                    decoration: BoxDecoration(),
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container();
          },
        ));
  }
}
