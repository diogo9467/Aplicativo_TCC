// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'evento_padrao_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventoPadraoListBack on _EventoPadraoListBack, Store {
  final _$listAtom = Atom(name: '_EventoPadraoListBack.list');

  @override
  Future<List<EventoPadrao>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<EventoPadrao>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_EventoPadraoListBackActionController =
      ActionController(name: '_EventoPadraoListBack');

  @override
  dynamic refreshList([dynamic valu1e]) {
    final _$actionInfo = _$_EventoPadraoListBackActionController.startAction(
        name: '_EventoPadraoListBack.refreshList');
    try {
      return super.refreshList(valu1e);
    } finally {
      _$_EventoPadraoListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
