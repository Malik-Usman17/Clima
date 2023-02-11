  import 'package:geolocator/geolocator.dart';


  class Location {

    double? lat;
    double? long;
    late bool serviceEnabled;

    // Future<void> getCurrentLocation() async {
    //   try {
    //     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    //     lat = position.latitude;
    //     long = position.longitude;
    //   }
    //   catch(e){
    //     print("show catch error $e");
    //   }
    // }

    Future getCurrentLocation() async {
      try{
        LocationPermission permission;
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          return Future.error('Location services are disabled.');
        }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.denied) {
              return Future.error('Location permissions are denied');
            }
          }

        if (permission == LocationPermission.deniedForever) {
            return Future.error(
                'Location permissions are permanently denied, we cannot request permissions.');
          }
          Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
          lat = position.latitude;
          long = position.longitude;
      }
      catch(error){
        print(error);
      }
    }
  }
