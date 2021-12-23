//@dart=2.9
// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:tcc/app/domain/entities/ciclo.dart';
import 'package:tcc/app/domain/services/ciclo_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class CicloFormBack {
  Ciclo ciclo;
  var _service = GetIt.I.get<CicloService>();
  bool _identificacaoIsValid;
  bool _ultimoCioIsValid;
  bool _ultimaCriaIsValid;

  bool get isValid =>
      _identificacaoIsValid && _ultimoCioIsValid && _ultimaCriaIsValid;

  CicloFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    ciclo = (parameter == null)
        ? Ciclo(
            identificacao: '',
            ultimo_cio: '',
            ultima_cria: '',
            id: null,
          )
        : parameter;
  }

  save() async {
    await _service.save(ciclo);
  }

  String validateIdentificacao(String identificacao) {
    try {
      _service.validateIdentificacao(identificacao);
      _identificacaoIsValid = true;
      return null;
    } catch (e) {
      _identificacaoIsValid = false;
      return e.toString();
    }
  }

  String validateUltimoCio(String ultimocio) {
    try {
      _service.validateUltimo_cio(ultimocio);
      _ultimoCioIsValid = true;
      return null;
    } catch (e) {
      _ultimoCioIsValid = false;
      return e.toString();
    }
  }

  String validateUltimaCria(String ultimacria) {
    try {
      _service.validateUltima_cria(ultimacria);
      _ultimaCriaIsValid = true;
      return null;
    } catch (e) {
      _ultimaCriaIsValid = false;
      return e.toString();
    }
  }

  void goToBack() {}
}
