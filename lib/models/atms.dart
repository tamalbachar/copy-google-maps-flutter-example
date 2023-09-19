import 'package:google_maps_flutter/google_maps_flutter.dart';

class ATMs {
  final String id;
  final String atmName;
  final String address;
  final LatLng latlong;
  final int pincode;

  const ATMs(
      {required this.id,
      required this.atmName,
      required this.address,
      required this.latlong,
      required this.pincode});
}
