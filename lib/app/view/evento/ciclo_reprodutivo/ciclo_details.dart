//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:tcc/app/domain/entities/ciclo.dart';
import 'package:tcc/app/view/evento/ciclo_reprodutivo/ciclo_details_back.dart';

class CicloDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = CicloDetailsBack(context);
    Ciclo ciclo = _back.ciclo;

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
                      'https://simcides.com.br/wp-content/uploads/2020/06/cow2.png',
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${ciclo.identificacao}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              if ('${ciclo.ultimo_cio}' != "")
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text('Ultimo cio'),
                    subtitle: Text('${ciclo.ultimo_cio}'),
                  ),
                ),
              if ('${ciclo.dia_cio}' != "")
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text('Proximo cio '),
                    subtitle: Text('${ciclo.dia_cio}'),
                  ),
                ),
              if ('${ciclo.ultima_cria}' != "")
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text('Ultima cria'),
                    subtitle: Text('${ciclo.ultima_cria}'),
                  ),
                ),
              if ('${ciclo.dia_cria}' != "")
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text('Proximo cio em caso de cria'),
                    subtitle: Text('${ciclo.dia_cria}'),
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
