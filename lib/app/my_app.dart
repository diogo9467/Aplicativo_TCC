//@dart=2.9
// ignore_for_file: constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:tcc/app/view/calendar.dart';
import 'package:tcc/app/view/animals/animal_details.dart';
import 'package:tcc/app/view/animals/animal_form.dart';
import 'package:tcc/app/view/animals/animal_list.dart';
import 'package:flutter/material.dart';
import 'package:tcc/app/view/ciclo_form.dart';
import 'package:tcc/app/view/event_day.dart';
import 'package:tcc/app/view/event_form.dart';
import 'package:tcc/app/view/event_pad_form.dart';
import 'package:tcc/app/view/home.dart';
import 'package:tcc/app/view/vaccine_form.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const ANIMAL_FORM = 'animal-form';
  static const ANIMAL_DETAILS = 'animal-details';
  static const ANIMAL_LIST = 'animal-list';
  static const CALENDAR = 'calendar';
  static const EVENT_DAY = 'event_day';
  static const EVENT_FORM = 'event_form';
  static const CICLO_FORM = 'ciclo_form';
  static const VACCINE_FORM = 'vaccine_form';
  static const EVENT_PAD_FORM = 'event_pad_form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        HOME: (context) => Home(),
        CALENDAR: (context) => Calendar(),
        EVENT_DAY: (context) => Event_day(),
        ANIMAL_LIST: (context) => AnimalList(),
        ANIMAL_FORM: (context) => AnimalForm(),
        ANIMAL_DETAILS: (context) => AnimalDetails(),
        EVENT_FORM: (context) => Event_form(),
        CICLO_FORM: (context) => Ciclo_form(),
        VACCINE_FORM: (context) => Vaccine_form(),
        EVENT_PAD_FORM: (context) => Event_pad_form(),
      },
    );
  }
}
