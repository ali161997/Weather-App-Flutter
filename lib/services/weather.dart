import 'location.dart';
import 'networking.dart';

String openWeatherMapURi = 'https://api.openweathermap.org/data/2.5/find';
String apiKey = 'Your-Api-Key-For-open-weather-map';

class WeatherModel {
  Future getCityWeather(cityName) async {
    String url =
        '${openWeatherMapURi}?q=${cityName}&appid=${apiKey}&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData();
    return data;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getLocation();

    String url =
        '${openWeatherMapURi}?lat=${location.lat}&lon=${location.lon}&cnt=10&appid=${apiKey}&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
