//@dart=2.9

import 'package:tcc/app/injection.dart';
import 'package:flutter/material.dart';
import 'app/my_app.dart';

void main() async {
  await setupInjection();
  runApp(MyApp());
}
