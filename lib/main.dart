//@dart=2.9

// ignore_for_file: unused_local_variable, avoid_print

import 'package:tcc/app/domain/services/auth_service.dart';
import 'package:tcc/app/injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/my_app.dart';

void main() async {
  await setupInjection();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService.getglobal())
      ],
      child: MyApp(),
    ),
  );
}
