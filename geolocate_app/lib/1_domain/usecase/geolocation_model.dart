import 'package:flutter/material.dart';
import 'package:geolocate_app/1_domain/repositories/geolocation_repo.dart';
import 'package:geolocate_app/2_data/repositories/geolocation_repo_impl.dart';

class GeolocationModel extends ChangeNotifier{
  double latitude;
  double longitude;

  GeolocationModel({
    required this.latitude,
    required this.longitude,
  });

  Future<void> updateLocation() async {
    GeolocationRepo geolocationRepo = GeolocationRepoImpl();
    var geolocation = await geolocationRepo.getGeolocation();
    latitude = geolocation.latitude;
    longitude = geolocation.longitude;
    notifyListeners();
  }
}
