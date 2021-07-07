import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();


  //Flujo de datos - STREAMS
  //Stream - Firebase
  //StreamController en case de que los datos necesiten ser tomados con una DB fuera de Firebase

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase; //nos devuelve el estado de la sesion

  //Casos de uso del objeto USER
  //1. Hacer SignIn a la aplicaion de google

  Future<FirebaseUser>signIn() => _auth_repository.signInFirebase();

  // 2. Hacer SIGNOUOT
  signOut() {
    _auth_repository.signOut();
  }

  // 3. Registrar usuario en base de datos

  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);

  @override
  void dispose() {
    // TODO: implement dispose



  }

}