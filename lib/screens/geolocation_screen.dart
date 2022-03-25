import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';

import 'package:shodaimama_bill/services/location_api.dart';

class GeolocationScreen extends StatefulWidget {
  const GeolocationScreen({Key? key}) : super(key: key);

  @override
  _GeolocationScreenState createState() => _GeolocationScreenState();
}

class _GeolocationScreenState extends State<GeolocationScreen> {
  Position? position;

  fetchPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    String latitude;
    String longitude;

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

    Position currentPosition = await Geolocator.getCurrentPosition();
    setState(() {
      position = currentPosition;
      latitude = currentPosition.latitude.toString();
    });
  }

  @override
  void initState() {
    fetchPosition();
    super.initState();
  }

  // GeolocationService geolocationService = GeolocationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Location'),
      ),
      // body: FutureBuilder<Position>(
      //   future: determinePosition(),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     return Center(
      //       child: Text(
      //         'Lat: ${snapshot.data?.latitude}, Long: ${snapshot.data?.longitude}',
      //         style: const TextStyle(
      //           fontSize: 21,
      //           fontWeight: FontWeight.w500,
      //         ),
      //       ),
      //     );
      //   },
      // ),

      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              position == null ? 'location' : position.toString(),
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var lat = position?.latitude.toString();
                var long = position?.longitude.toString();

                fetchPosition();

                await locationAPI(lat!, long!);
              },
              child: const Text('get location'),
            ),
          ],
        ),
      ),
    );
  }
}
