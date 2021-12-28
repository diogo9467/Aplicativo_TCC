//@dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:tcc/app/domain/entities/vacina.dart';
import 'package:tcc/app/view/evento/vacina/vacina_details_back.dart';

class VacinaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = VacinaDetailsBack(context);
    Vacina vacina = _back.vacina;

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
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUw-t2Op2vTVwrq_2isyqgOotFgiyHLhGvXg&usqp=CAU',
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${vacina.nome}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Nome do animal em que será aplicado:'),
                  subtitle: Text('${vacina.identificacao}'),
                ),
              ),
              if ('${vacina.ult_aplicacao}' != "")
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text('Ultima aplicacao:'),
                    subtitle: Text('${vacina.ult_aplicacao}'),
                  ),
                ),
              if ('${vacina.intervalo_doses}' != "")
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text('Intervalo das doses:'),
                    subtitle: Text('${vacina.intervalo_doses}'),
                  ),
                ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Quantidade de doses:'),
                  subtitle: Text('${vacina.quant_doses}'),
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
