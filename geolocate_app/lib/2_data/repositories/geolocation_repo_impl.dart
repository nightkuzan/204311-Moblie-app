import 'package:geolocate_app/1_domain/entities/geolocation_entity.dart';
import 'package:geolocate_app/1_domain/repositories/geolocation_repo.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationRepoImpl implements GeolocationRepo {
  @override
  Future<GeolocationEntity> getGeolocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return GeolocationEntity(
        latitude: position.latitude, longitude: position.longitude);

  }
  
  @override
  Future getGeoLocation() {
      
    
    throw UnimplementedError();
  }
}
