import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '7c58f6710d1e93134d90c743e0ea1f75';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  
  Future<dynamic> getCityWeatherData(String city) async {
    var url = '$openWeatherMapURL?q=$city&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location myDeviceLocation = Location();
    await myDeviceLocation.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${myDeviceLocation.lat}&lon=${myDeviceLocation.long}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}