import 'dart:async';

import 'package:geolocator/geolocator.dart';

class GeolocationService {
  StreamSubscription<Position> getCurrentLocation() {
    LocationSettings locationSettings =
        AndroidSettings(accuracy: LocationAccuracy.high, distanceFilter: 10);

    return Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) {
      (position == null
          ? 'Unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
    });
  }

  Future<Position> getInitialLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
