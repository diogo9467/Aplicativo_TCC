//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:tcc/app/domain/entities/user.dart';

class UserDetailsBack {
  BuildContext context;
  User user;

  UserDetailsBack(this.context) {
    user = ModalRoute.of(context).settings.arguments;
  }
}
