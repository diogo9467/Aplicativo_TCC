//@dart=2.9

import 'package:tcc/app/database/firestore/animal_dao_firestore.dart';
import 'package:tcc/app/database/firestore/ciclo_dao_firestore.dart';
import 'package:tcc/app/database/firestore/vacina_dao_firestore.dart';
import 'package:tcc/app/domain/interfaces/animal_dao.dart';
import 'package:tcc/app/domain/interfaces/ciclo_dao.dart';
import 'package:tcc/app/domain/interfaces/vacina_dao.dart';
import 'package:tcc/app/domain/services/animal_service.dart';
import 'package:tcc/app/database/firestore/evento_padrao_dao_firestore.dart';
import 'package:tcc/app/domain/interfaces/evento_padrao_dao.dart';
import 'package:tcc/app/domain/services/ciclo_service.dart';
import 'package:tcc/app/domain/services/evento_padrao_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tcc/app/domain/services/vacina_service.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  getIt.registerSingleton<AnimalDAO>(AnimalDAOFirestore());
  getIt.registerSingleton<AnimalService>(AnimalService());
  getIt.registerSingleton<EventoPadraoDAO>(EventoPadraoDAOFirestore());
  getIt.registerSingleton<EventoPadraoService>(EventoPadraoService());
  getIt.registerSingleton<VacinaDAO>(VacinaDAOFirestore());
  getIt.registerSingleton<VacinaService>(VacinaService());
  getIt.registerSingleton<CicloDAO>(CicloDAOFirestore());
  getIt.registerSingleton<CicloService>(CicloService());
}
