//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:tcc/app/domain/entities/animal.dart';
import 'package:tcc/app/view/animals/animal_details_back.dart';
import 'package:flutter/material.dart';

class AnimalDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = AnimalDetailsBack(context);
    Animal animal = _back.animal;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var widht = constraints.biggest.width;
        var radius = widht / 4.5;
        var radiuss = widht / 4.3;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              CircleAvatar(
                radius: radiuss,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: radius,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/677/677864.png',
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${animal.identificacao}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Sexo'),
                  subtitle: Text('${animal.sexo}'),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Raça'),
                  subtitle: Text('${animal.raca}'),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Data de Nascimento'),
                  subtitle: Text('${animal.data_nascimento}'),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Data de Aquisição'),
                  subtitle: Text('${animal.data_aquisicao}'),
                ),
              ),
              if ('${animal.inicio_lactacao}' != "")
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text('Inicio do período de lactação'),
                    subtitle: Text('${animal.inicio_lactacao}'),
                  ),
                ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
