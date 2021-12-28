//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tcc/app/domain/entities/evento_padrao.dart';
import 'package:tcc/app/view/evento/evento_padrao/evento_padrao_details_back.dart';

class EventoPadraoDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = EventoPadraoDetailsBack(context);
    EventoPadrao evento_padrao = _back.eventoPadrao;

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
                      'https://png.pngtree.com/png-vector/20190926/ourlarge/pngtree-schedule-glyph-icon-vector-png-image_1742916.jpg',
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${evento_padrao.nome}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Data'),
                  subtitle: Text('${evento_padrao.data}'),
                ),
              ),
              if ('${evento_padrao.observacao}' != "")
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text('Observacao'),
                    subtitle: Text('${evento_padrao.observacao}'),
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
