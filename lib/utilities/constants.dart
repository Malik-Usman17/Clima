import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 80.0,
  fontWeight: FontWeight.w900
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
    fontWeight: FontWeight.w900
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
    fontWeight: FontWeight.w900,
  color: Colors.white
);

const kConditionTextStyle = TextStyle(
    fontSize: 100.0,
    // fontWeight: FontWeight.w900
);

const kTextInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
        Icons.location_city,
        color: Colors.white,
    ),
    hintText: "Enter city name",
    hintStyle: TextStyle(
        color: Colors.grey
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none
    ),
);