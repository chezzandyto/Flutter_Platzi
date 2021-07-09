

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'circle_button.dart';
import 'package:image_picker/image_picker.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    final picker = ImagePicker();
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            //CircleButton(true, Icons.turned_in_not, 20.0, Color.fromRGBO(255, 255, 255, 1)),
            //Para cambiar la contraseña
            CircleButton(true, Icons.vpn_key, 20.0, Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            //Para agregar un nuevo lugar - tomar una foto nueva
            CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1), () {
              /*ImagePicker.pickImage(source: ImageSource.camera)
              .then((File image) {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: image)));
              }).catchError((onError) => print(onError));*/
              picker.getImage(source: ImageSource.camera).then((PickedFile image) {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: File(image.path))));
              }).catchError((onError) => print("E R R O R PICKER IMAGE: ${onError}"));
            }),
            //Cerrar sesion
            CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6), () => {
              userBloc.signOut()
            }),
            //CircleButton(true, Icons.person, 20.0, Color.fromRGBO(255, 255, 255, 0.6))
          ],
        )
    );
  }

}