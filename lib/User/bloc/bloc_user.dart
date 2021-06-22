import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();


  //Flujo de datos - STREAMS
  //Stream - Firebase
  //StreamController en case de que los datos necesiten ser tomados con una DB fuera de Firebase

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase; //nos devuelve el estado de la sesion

  //Casos de uso del objeto USER
  //1. Hacer SignIn a la aplicaion de google

  Future<FirebaseUser>signIn(){
    return _auth_repository.signInFirebase();
  }

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose



  }

}