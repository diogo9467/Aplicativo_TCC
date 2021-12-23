//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:tcc/app/domain/entities/ciclo.dart';

class CicloDetailsBack {
  BuildContext context;
  Ciclo ciclo;

  CicloDetailsBack(this.context) {
    ciclo = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}
