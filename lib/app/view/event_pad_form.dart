//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';

class Event_pad_form extends StatelessWidget {
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
          'Eventos padrão',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: SingleChildScrollView(),
    );
  }
}
