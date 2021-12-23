//@dart=2.9

import 'package:tcc/app/domain/services/auth_service.dart';
import 'package:tcc/app/injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/my_app.dart';

void main() async {
  await setupInjection();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthService())],
      child: MyApp(),
    ),
  );
}
