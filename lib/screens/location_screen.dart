import 'package:clima/screens/city_Screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, this.locationWeather}) : super(key: key);

  final locationWeather;
  // LocationScreen({})

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherMsg;
  late String weatherIcon;
  late String cityName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if(weatherData == null){
        temperature = 0;
        weatherIcon = 'Error';
        weatherMsg = 'Unable to get weather data.';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherMsg = weather.getMessage(temperature);
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            //colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop)
          )
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 50,
                    onPressed: () async{
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    icon: const Icon(Icons.near_me),
                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const CityScreen();
                        },),);
                      print(typedName);
                      if(typedName != null) {
                        var weatherData = await weather.getCityWeatherData(typedName);
                        updateUI(weatherData);
                      }
                    },
                    icon: const Icon(Icons.location_city),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text('$temperature°', style: kTempTextStyle,),
                    Text(weatherIcon, style: kConditionTextStyle,),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMsg in $cityName',
                  // "It's 🍦 time in San Francisco!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
