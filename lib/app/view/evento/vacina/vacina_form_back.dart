//@dart=2.9
// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:tcc/app/domain/entities/vacina.dart';
import 'package:tcc/app/domain/services/vacina_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class VacinaFormBack {
  Vacina vacina;
  var _service = GetIt.I.get<VacinaService>();
  bool _nomeIsValid;
  bool _ult_aplicacaoIsValid;
  bool _intervalo_dosesIsValid;
  bool _quant_dosesIsValid;
  bool _identificacaoIsValid;

  bool get isValid =>
      _nomeIsValid &&
      _ult_aplicacaoIsValid &&
      _intervalo_dosesIsValid &&
      _quant_dosesIsValid &&
      _identificacaoIsValid;

  VacinaFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    vacina = (parameter == null)
        ? Vacina(
            nome: '',
            ult_aplicacao: '',
            intervalo_doses: '',
            quant_doses: '',
            identificacao: '',
            id: null,
          )
        : parameter;
  }

  save() async {
    await _service.save(vacina);
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

  String validateUlt_aplicacao(String ult_aplicacao) {
    try {
      _service.validateUlt_aplicacao(ult_aplicacao);
      _ult_aplicacaoIsValid = true;
      return null;
    } catch (e) {
      _ult_aplicacaoIsValid = false;
      return e.toString();
    }
  }

  String validateIntervalo_doses(String intervalo_doses) {
    try {
      _service.validateIntervalo_doses(intervalo_doses);
      _intervalo_dosesIsValid = true;
      return null;
    } catch (e) {
      _intervalo_dosesIsValid = false;
      return e.toString();
    }
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

  String validateQuant_doses(String quant_doses) {
    try {
      _service.validateQuant_doses(quant_doses);
      _quant_dosesIsValid = true;
      return null;
    } catch (e) {
      _quant_dosesIsValid = false;
      return e.toString();
    }
  }

  void goToBack() {}
}
