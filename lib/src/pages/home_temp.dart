import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Rojo','Azul','Amarillo','Negro','Gris'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemsCorta()
      ),
    );
  }

  List<Widget> _crearItems() {

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {

      final tempWidget = ListTile(
        title: Text( opt ),
      );

      lista..add( tempWidget )
          ..add( Divider( 
            color: Colors.blue, 
            thickness: 2.0,
            height: 1.0,)
          );

    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {

    return opciones.map( ( item ) {
      
      return Column(
        children: <Widget>[
          ListTile(
            title: Text( item ),
            subtitle: Text('Main color'),
            selected: true,
            leading: Icon( Icons.add_photo_alternate_sharp ),
            trailing: Icon( Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );

    }).toList();

  }

}