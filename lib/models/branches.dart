import 'package:google_maps_flutter/google_maps_flutter.dart';

class Branches {
  final String id;
  final String branchName;
  final String address;
  final LatLng latlong;
  final int pincode;

  const Branches(
      {required this.id,
      required this.branchName,
      required this.address,
      required this.latlong,
      required this.pincode});
}
