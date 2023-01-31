import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }
   void getLocation() async {
    Location myDeviceLocation = Location();
    await myDeviceLocation.getCurrentLocation();
    print('LATITUDE: ${myDeviceLocation.lat}');
    print('LONGITUDE: ${myDeviceLocation.long}');
   }

   void getData() async {
    Response res = await get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=b1b15e88fa797225412429c1c50c122a1'));
    print(res);
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
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Get Location'),
          onPressed: () {
            getLocation();
          },
        ),
      ),
    );
  }
}
