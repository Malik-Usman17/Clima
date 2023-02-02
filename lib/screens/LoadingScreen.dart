import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = '7c58f6710d1e93134d90c743e0ea1f75';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // double? latitude;
  // double? longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }
   void getLocation() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
   }

  // getLocation() async {
  //     bool serviceEnabled;
  //     LocationPermission permission;
  //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //     if (!serviceEnabled) {
  //       return Future.error('Location services are disabled.');
  //     }
  //
  //     permission = await Geolocator.checkPermission();
  //     if (permission == LocationPermission.denied) {
  //       permission = await Geolocator.requestPermission();
  //       if (permission == LocationPermission.denied) {
  //         return Future.error('Location permissions are denied');
  //       }
  //     }
  //     if (permission == LocationPermission.deniedForever) {
  //       return Future.error(
  //           'Location permissions are permanently denied, we cannot request permissions.');
  //     }
  //     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  //     print(position);
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    //getData();
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        )
      ),
    );
  }
}
