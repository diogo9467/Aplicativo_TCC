//@dart=2.9
import 'package:tcc/app/domain/entities/contact.dart';
import 'package:flutter/cupertino.dart';

class ContactDetailsBack {
  BuildContext context;
  Contact contact;

  ContactDetailsBack(this.context) {
    contact = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}