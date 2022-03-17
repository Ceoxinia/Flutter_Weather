import 'package:flutter/material.dart';

Widget add_info_cont(String info, String pic, String value) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      width: 105,
      height: 105,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Text('$info',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
            Expanded(
              child: Image(
                image: AssetImage(pic),
              ),
            ),
            Expanded(
              child: Text('$value',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          ]));
}
