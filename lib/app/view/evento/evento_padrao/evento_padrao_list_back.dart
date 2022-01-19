//@dart=2.9
// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tcc/app/domain/entities/evento_padrao.dart';
import 'package:tcc/app/domain/services/evento_padrao_service.dart';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_details.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_form.dart';

part 'evento_padrao_list_back.g.dart';

class EventoPadraoListBack = _EventoPadraoListBack with _$EventoPadraoListBack;

abstract class _EventoPadraoListBack with Store {
  var _service = GetIt.I.get<EventoPadraoService>();

  //lista de contatos
  @observable
  Future<List<EventoPadrao>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _EventoPadraoListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [EventoPadrao eventoPadrao]) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => EventoPadraoForm()),
      (Route<dynamic> route) => false,
    );
  }

  goToDetails(BuildContext context, EventoPadrao eventoPadrao) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => EventoPadraoDetails()),
      (Route<dynamic> route) => false,
    );
  }

  //excluir
  remove(dynamic id) {
    _service.remove(id);
    refreshList();
  }
}
