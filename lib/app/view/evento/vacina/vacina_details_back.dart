//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:tcc/app/domain/entities/vacina.dart';

class VacinaDetailsBack {
  BuildContext context;
  Vacina vacina;

  VacinaDetailsBack(this.context) {
    vacina = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}
