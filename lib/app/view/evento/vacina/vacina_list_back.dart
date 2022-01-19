//@dart=2.9
// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tcc/app/domain/entities/vacina.dart';
import 'package:tcc/app/domain/services/vacina_service.dart';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc/app/view/evento/vacina/vacina_details.dart';
import 'package:tcc/app/view/evento/vacina/vacina_form.dart';

part 'vacina_list_back.g.dart';

class VacinaListBack = _VacinaListBack with _$VacinaListBack;

abstract class _VacinaListBack with Store {
  var _service = GetIt.I.get<VacinaService>();

  //lista de contatos
  @observable
  Future<List<Vacina>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _VacinaListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Vacina vacina]) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => VacinaForm()),
      (Route<dynamic> route) => false,
    );
  }

  goToDetails(BuildContext context, Vacina vacina) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => VacinaDetails()),
      (Route<dynamic> route) => false,
    );
  }

  //excluir
  remove(dynamic id) {
    _service.remove(id);
    refreshList();
  }
}
