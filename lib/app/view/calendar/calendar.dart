//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:tcc/app/view/bar/bloc.navigation_bloc/navigation_bloc.dart';

class Calendar extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Calendário',
            style: TextStyle(color: Colors.green),
          ),
        ),
        body: SingleChildScrollView(),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: []));
  }
}
