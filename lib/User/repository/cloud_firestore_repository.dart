import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestorAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestorAPI.updateUserData(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestorAPI.updatePlaceData(place);
}