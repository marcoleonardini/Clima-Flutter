import 'package:geolocator/geolocator.dart';

class LocationApp {
  double longitude;
  double latitude;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      this.latitude = position.latitude;
      this.longitude = position.longitude;

      return position;
    } catch (e) {
      return null;
    }
  }
}
