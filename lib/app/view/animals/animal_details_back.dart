//@dart=2.9
import 'package:tcc/app/domain/entities/animal.dart';
import 'package:flutter/cupertino.dart';

class AnimalDetailsBack {
  BuildContext context;
  Animal animal;

  AnimalDetailsBack(this.context) {
    animal = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}
