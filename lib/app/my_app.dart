// ignore_for_file: import_of_legacy_library_into_null_safe, constant_identifier_names

import 'package:tcc/app/view/bar/sidebar/sidebar_layout.dart';

import 'package:tcc/app/view/animals/animal_details.dart';
import 'package:tcc/app/view/animals/animal_form.dart';
import 'package:tcc/app/view/animals/animal_list.dart';
import 'package:flutter/material.dart';
import 'package:tcc/app/view/evento/ciclo_reprodutivo/ciclo_details.dart';
import 'package:tcc/app/view/evento/ciclo_reprodutivo/ciclo_form.dart';

import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_details.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_form.dart';
import 'package:tcc/app/view/evento/vacina/vacina_details.dart';
import 'package:tcc/app/view/evento/vacina/vacina_form.dart';

class MyApp extends StatelessWidget {
  static const HOME = 'home';
  static const ANIMAL_FORM = 'animal-form';
  static const ANIMAL_DETAILS = 'animal-details';
  static const ANIMAL_LIST = 'animal-list';
  static const CALENDAR = 'calendar';
  static const EVENT_DAY = 'event_day';
  static const EVENT_FORM = 'event_form';
  static const VACCINE_FORM = 'vaccine_form';
  static const VACINA_FORM = 'vacina_form';
  static const VACINA_DETAILS = 'vacina_details';
  static const EVENTO_PADRAO_FORM = 'evento_padrao_form';
  static const EVENTO_PADRAO_DETAILS = 'evento_padrao_details';
  static const CICLO_DETAILS = 'ciclo_details';
  static const CICLO_FORM = 'ciclo_form';
  static const USER_FORM = 'user_form';

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SideBarLayout(),
      routes: {
        ANIMAL_LIST: (context) => AnimalList(),
        ANIMAL_FORM: (context) => AnimalForm(),
        ANIMAL_DETAILS: (context) => AnimalDetails(),
        VACINA_FORM: (context) => VacinaForm(),
        VACINA_DETAILS: (context) => VacinaDetails(),
        EVENTO_PADRAO_FORM: (context) => EventoPadraoForm(),
        EVENTO_PADRAO_DETAILS: (context) => EventoPadraoDetails(),
        CICLO_DETAILS: (context) => CicloDetails(),
        CICLO_FORM: (context) => CicloForm(),
      },
    );
  }
}
