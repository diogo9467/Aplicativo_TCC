//@dart=2.9
import 'package:agenda/app/injection.dart';

import 'package:flutter/material.dart';

import 'app/my_app.dart';

void main() {
  setupInjection();
  runApp(MyApp());
}
