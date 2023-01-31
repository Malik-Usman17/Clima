import 'package:geolocator/geolocator.dart';


class Location {

  double? lat;
  double? long;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      long = position.longitude;
    }
    catch(e){
      print("show catch error $e");
    }
  }

  }


  //
  // void getLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  //   latitude = position.latitude;
  //   longitude = position.longitude;
  // }

//}