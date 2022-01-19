//@dart=2.9
// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tcc/app/domain/entities/animal.dart';
import 'package:tcc/app/domain/services/animal_service.dart';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc/app/view/animals/animal_details.dart';
import 'package:tcc/app/view/animals/animal_form.dart';

part 'animal_list_back.g.dart';

class AnimalListBack = _AnimalListBack with _$AnimalListBack;

abstract class _AnimalListBack with Store {
  var _service = GetIt.I.get<AnimalService>();

  @observable
  Future<List<Animal>> list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _AnimalListBack() {
    refreshList();
  }

  goToForm(BuildContext context, [Animal animal]) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AnimalForm()),
      (Route<dynamic> route) => false,
    );
  }

  goToDetails(BuildContext context, Animal animal) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AnimalDetails()),
      (Route<dynamic> route) => false,
    );
  }

  remove(dynamic id) {
    _service.remove(id);
    refreshList();
  }
}
