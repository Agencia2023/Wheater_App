import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/weather_locations.dart';
import '../provider/wheater.provider.dart';
import '../screens/wheater.screen.dart';
import '../widgets/additional_information.dart';

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
              print(data!.icon);
              if (data!.icon == '03n') {
                bgImg = 'assets/noche_nubes.jpg';
                coloricon = Colors.black;
              } else if (data!.icon == '01n') {
                bgImg = 'assets/noche_despejada.jpg';
                coloricon = Colors.white;
              } else if (data!.icon == '01d') {
                bgImg = 'assets/dia_soleado.jpg';
                coloricon = Colors.black;
              } else if (data!.icon == '02d') {
                bgImg = 'assets/dia_opaco.jpg';
                coloricon = Colors.black;
              } else if (data!.icon == '09n') {
                bgImg = 'assets/noche_lluvia.jpg';
                coloricon = Colors.black;
              } else if (data!.icon == "09d") {
                bgImg = 'assets/dia_lluvia.jpg';
                coloricon = Colors.black;
              } else if (data!.icon == "11d") {
                bgImg = 'assets/dia_tormenta.jpg';
                coloricon = Colors.black;
              } else if (data!.icon == "11n") {
                bgImg = 'assets/noche_tormenta.jpg';
                coloricon = Colors.black;
              } else if (data!.icon == '04n') {
                bgImg = 'assets/noche_nubes.jpg';
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
                      "${date1}",
                      "${data!.cityName}",
                      "${data!.main}",
                      "${data!.temp}",
                      "${data!.wind}",
                      "${data!.rain}",
                      "${data!.dt}",
                      "${data!.humidity}",
                      "${data!.pressure}",
                      "${data!.feels_like}",
                      "${data!.icon}"),

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
