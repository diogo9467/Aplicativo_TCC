//@dart=2.9
// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:tcc/app/domain/entities/animal.dart';
import 'package:tcc/app/domain/services/animal_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class AnimalFormBack {
  Animal animal;
  var _service = GetIt.I.get<AnimalService>();
  bool _identificationIsValid;
  bool _racaIsValid;
  bool _sexoIsValid;
  bool _data_nascimentoIsValid;
  bool _data_aquisicaoIsValid;
  bool _inicio_lactacaoIsValid;

  bool get isValid =>
      _identificationIsValid &&
      _racaIsValid &&
      _sexoIsValid &&
      _data_nascimentoIsValid &&
      _data_aquisicaoIsValid &&
      _inicio_lactacaoIsValid;

  AnimalFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    animal = (parameter == null)
        ? Animal(
            raca: '',
            id: null,
            identificacao: '',
            sexo: '',
            urlAvatar: '',
            data_nascimento: '',
            data_aquisicao: '',
            inicio_lactacao: '',
          )
        : parameter;
  }

  save() async {
    await _service.save(animal);
  }

  String validateIdentification(String identification) {
    try {
      _service.validateIdentification(identification);
      _identificationIsValid = true;
      return null;
    } catch (e) {
      _identificationIsValid = false;
      return e.toString();
    }
  }

  String validateRaca(String raca) {
    try {
      _service.validateRaca(raca);
      _racaIsValid = true;
      return null;
    } catch (e) {
      _racaIsValid = false;
      return e.toString();
    }
  }

  String validateSexo(String sexo) {
    try {
      _service.validateSexo(sexo);
      _sexoIsValid = true;
      return null;
    } catch (e) {
      _sexoIsValid = false;
      return e.toString();
    }
  }

  String validateData_nascimento(String data_nascimento) {
    try {
      _service.validateData_nascimento(data_nascimento);
      _data_nascimentoIsValid = true;
      return null;
    } catch (e) {
      _data_nascimentoIsValid = false;
      return e.toString();
    }
  }

  String validateData_aquisicao(String data_aquisicao) {
    try {
      _service.validateData_aquisicao(data_aquisicao);
      _data_aquisicaoIsValid = true;
      return null;
    } catch (e) {
      _data_aquisicaoIsValid = false;
      return e.toString();
    }
  }

  String validateInicio_lactacao(String inicio_lactacao) {
    try {
      _service.validateInicio_lactacao(inicio_lactacao);
      _inicio_lactacaoIsValid = true;
      return null;
    } catch (e) {
      _inicio_lactacaoIsValid = false;
      return e.toString();
    }
  }

  void goToBack() {}
}
