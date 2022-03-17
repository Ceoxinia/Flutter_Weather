import 'package:flutter/material.dart';

Widget weather_column(String pic, String temp, String country) {
  return Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Image(
          image: AssetImage(pic),
        ),
        SizedBox(
          height: 40.0,
        ),
        Text("$temp",
            style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 20.0,
        ),
        Text("$country",
            style: TextStyle(
              fontSize: 17.0,
              fontFamily: 'Arial',
              color: Colors.white,
            ))
      ]));
}
