import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';


class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover
          )
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  iconSize: 50.0,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: kTextInputDecoration,
                  onChanged: (val) {
                    cityName = val;
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
