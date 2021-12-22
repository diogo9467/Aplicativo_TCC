//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:tcc/app/domain/entities/evento_padrao.dart';

class EventoPadraoDetailsBack {
  BuildContext context;
  EventoPadrao eventoPadrao;

  EventoPadraoDetailsBack(this.context) {
    eventoPadrao = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}
