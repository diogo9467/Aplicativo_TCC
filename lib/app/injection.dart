//@dart=2.9

import 'package:agenda/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:agenda/app/domain/interfaces/contact_dao.dart';
import 'package:agenda/app/domain/services/contact_services.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
  getIt.registerSingleton<ContactService>(ContactService());
}
