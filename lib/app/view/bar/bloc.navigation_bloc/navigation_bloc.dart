//@dart=2.9

// ignore_for_file: constant_identifier_names, prefer_const_constructors
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tcc/app/view/animals/animal_list.dart';

import 'package:tcc/app/view/evento/ciclo_reprodutivo/ciclo_list.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_list.dart';
import 'package:tcc/app/view/evento/vacina/vacina_list.dart';

import 'package:tcc/app/view/home/home_screen.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  AnimalListClickedEvent,
  VacinaListClickedEvent,
  CicloListClickedEvent,
  EventoPadraoClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc() : super(HomePage());

  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.AnimalListClickedEvent:
        yield AnimalList();
        break;
      case NavigationEvents.EventoPadraoClickedEvent:
        yield EventoPadraoList();
        break;
      case NavigationEvents.VacinaListClickedEvent:
        yield VacinaList();
        break;
      case NavigationEvents.CicloListClickedEvent:
        yield CicloList();
        break;
    }
  }
}
