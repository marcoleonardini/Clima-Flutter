import '../services/location.dart';
import '../services/networking.dart';

const String api_key = '76cb1237d1eb2f442d6f7578f98e88d7';
const String url = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  LocationApp _location = LocationApp();
  Future<dynamic> getLocationWeather() async {
    await _location.getLocation();

    NetworkHelper _networkHelper = NetworkHelper(
        url:
            '$url?lat=${_location.latitude}&lon=${_location.longitude}&appid=$api_key&units=metric');
    var data = await _networkHelper.getData();

    return data;
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
