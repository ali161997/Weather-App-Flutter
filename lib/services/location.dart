import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double lon;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      print('cannot get location');
    }
  }
}
