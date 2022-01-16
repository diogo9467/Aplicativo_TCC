//@dart=2.9
// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:tcc/app/domain/entities/evento_padrao.dart';
import 'package:tcc/app/domain/services/auth_service.dart';
import 'package:tcc/app/domain/services/evento_padrao_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class EventoPadraoFormBack {
  EventoPadrao eventopadrao;
  //var uid = EventoPadraoFormBack_.uid;
  var _service = GetIt.I.get<EventoPadraoService>();
  bool _nomeIsValid;
  bool _observacaoIsValid;
  bool _dataIsValid;
  bool _animalIsValid;

  bool get isValid =>
      _nomeIsValid && _observacaoIsValid && _dataIsValid && _animalIsValid;

  EventoPadraoFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    eventopadrao = (parameter == null)
        ? EventoPadrao(
            nome: '',
            data: '',
            observacao: '',
            animal: '',
            uid: AuthService.getUser().uid,
            id: null,
          )
        : parameter;
  }

  save() async {
    await _service.save(eventopadrao);
  }

  String validateNome(String nome) {
    try {
      _service.validateNome(nome);
      _nomeIsValid = true;
      return null;
    } catch (e) {
      _nomeIsValid = false;
      return e.toString();
    }
  }

  String validateData(String data) {
    try {
      _service.validateData(data);
      _dataIsValid = true;
      return null;
    } catch (e) {
      _dataIsValid = false;
      return e.toString();
    }
  }

  String validateObservacao(String observacao) {
    try {
      _service.validateObservacao(observacao);
      _observacaoIsValid = true;
      return null;
    } catch (e) {
      _observacaoIsValid = false;
      return e.toString();
    }
  }

  String validateAnimal(String animal) {
    try {
      _service.validateAnimal(animal);
      _animalIsValid = true;
      return null;
    } catch (e) {
      _animalIsValid = false;
      return e.toString();
    }
  }

  void goToBack() {}
}
