import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pronostico/models/weather_locations.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/weather_locations.dart';
import '../provider/wheater.provider.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
TextStyle infoFont =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget additionalInformation(
    String cityName,
    String main,
    String temp,
    String dt,
    String wind,
    String rain,
    String humidity,
    String pressure,
    String feels_like,
    String icon) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "$cityName",
                    style: GoogleFonts.lato(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      // color: colortexto,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$dt",
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      // color: colortexto,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "$temp" "°",
                    style: GoogleFonts.openSans(
                      fontSize: 85,
                      fontWeight: FontWeight.w600,
                      //  color: colortexto,
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //      SvgPicture.asset(
                  //        locationListBuilder[index].iconUrl,
                  //        width: 34,
                  //        height: 34,
                  //        color: colortexto,
                  //     // ),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Text(
                  //       "$wind",
                  //       style: GoogleFonts.lato(
                  //         fontSize: 25,
                  //         fontWeight: FontWeight.w500,
                  //         //  color: colortexto,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(),
                  ),
                  Column(
                    children: [
                      Text(
                        'Sensación Termica',
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          // color: colortexto,
                        ),
                      ),
                      Text(
                        "$feels_like" "°",
                        style: GoogleFonts.lato(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          // color: colortexto,
                        ),
                      ),
                      Text(
                        '',
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          //  color: colortexto,
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 5,
                            width: 50,
                            color: Colors.white38,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Humedad',
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          //  color: colortexto,
                        ),
                      ),
                      Text(
                        "$humidity",
                        style: GoogleFonts.lato(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          // color: colortexto,
                        ),
                      ),
                      Text(
                        '%',
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          //  color: colortexto,
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 5,
                            width: 50,
                            color: Colors.white38,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
