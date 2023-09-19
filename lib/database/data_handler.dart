import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemapsapp/database/constants.dart';
import 'package:googlemapsapp/models/atms.dart';
import 'package:googlemapsapp/models/branches.dart';
import 'package:googlemapsapp/models/store_offers.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static Future<Db> connect() async {
    return await Db.create(MONGO_CONN_URL);
  }

  static Future<List<ATMs>> fetchATMs() async {
    final db = await connect();
    await db.open();
    final atmCollection = db.collection('ATMs');
    final results = await atmCollection.find().toList();

    final atms = results.map((result) {
      return ATMs(
          id: result['id'],
          atmName: result['atm'],
          address: result['address'],
          latlong: LatLng(
            double.parse(result['latitude']),
            double.parse(result['longitude']),
          ),
          pincode: result['pincode']);
    }).toList();
    for (var atm in atms) {
      debugPrint("hello from atm atm");
      debugPrint(atm.latlong.toString());
    }
    // await db.close();
    return atms;
  }

  static Future<List<Branches>> fetchBranches() async {
    final db = await connect();
    await db.open();
    final collection = db.collection('Branches');
    final results = await collection.find().toList();

    final branches = results.map((result) {
      return Branches(
          id: result['id'],
          branchName: result['Branch'],
          address: result['Address'],
          latlong: LatLng(
            double.parse(result['latitude']),
            double.parse(result['longitude']),
          ),
          pincode: result['Pincode']);
    }).toList();
    for (var atm in branches) {
      debugPrint("hello from branch branch");
      debugPrint(atm.latlong.toString());
    }
    // await db.close();
    return branches;
  }

  static Future<List<Stores>> fetchStores() async {
    final db = await connect();
    await db.open();
    final collection = db.collection('Offers');
    final results = await collection.find().toList();

    final stores = results.map((result) {
      return Stores(
        id: result['_id'],
        storeName: result['storeName'],
        offer: result['offer'],
        offerDetails: result['offerDetails'],
        expiryDate: result['expiryDate'],
        creditCardOffer: result['creditCard'],
        debitCardOffer: result['debitCard'],
        latlong: LatLng(
          double.parse(result['latitude']),
          double.parse(result['longitude']),
        ),
      );
    }).toList();
    for (var atm in stores) {
      debugPrint("hello from store store");
      debugPrint(atm.latlong.toString());
    }
    // await db.close();
    return stores;
  }
}
