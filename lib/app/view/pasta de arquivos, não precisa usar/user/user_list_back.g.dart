// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'user_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserListBack on _UserListBack, Store {
  final _$listAtom = Atom(name: '_UserListBack.list');

  @override
  Future<List<User>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<User>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_AnimalListBackActionController =
      ActionController(name: '_UserListBack');

  @override
  dynamic refreshList([dynamic valu1e]) {
    final _$actionInfo = _$_AnimalListBackActionController.startAction(
        name: '_UserListBack.refreshList');
    try {
      return super.refreshList(valu1e);
    } finally {
      _$_AnimalListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
