import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Stores {
  final ObjectId id;
  final String storeName;
  final String offer;
  final DateTime expiryDate;
  final String offerDetails;
  final String debitCardOffer;
  final String creditCardOffer;
  final LatLng latlong;

  const Stores(
      {required this.id,
      required this.storeName,
      required this.offer,
      required this.expiryDate,
      required this.offerDetails,
      required this.debitCardOffer,
      required this.creditCardOffer,
      required this.latlong});
}
