//@dart=2.9
// ignore_for_file: constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:tcc/app/view/calendar.dart';
import 'package:tcc/app/view/conctact_details.dart';
import 'package:tcc/app/view/contact_form.dart';
import 'package:tcc/app/view/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:tcc/app/view/home.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const CONTACT_FORM = 'contact-form';
  static const CONTACT_DETAILS = 'contact-details';
  static const CONTACT_LIST = 'contact-list';
  static const CALENDAR = 'calendar';

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
        CONTACT_LIST: (context) => ContactList(),
        CONTACT_FORM: (context) => ContactForm(),
        CONTACT_DETAILS: (context) => ContactDetails(),
      },
    );
  }
}
