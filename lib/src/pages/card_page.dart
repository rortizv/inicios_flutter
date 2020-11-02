import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0), ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.blue ),
            title: Text('Título principal'),
            subtitle: Text('Vivamus suscipit tortor eget felis porttitor volutpat. Donec sollicitudin molestie malesuada. Donec rutrum congue leo eget malesuada.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {},
            )
          ],)
        ],
      ),
    );

  }
}

Widget _cardTipo2() {

  final card2 = Container(
    //clipBehavior: Clip.antiAlias
    //elevation: 15.0,
    child: Column(
      children: <Widget>[
        FadeInImage(
          image: NetworkImage('https://i.redd.it/x50cm40wq4z41.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration( milliseconds: 300 ),
          height: 300.0,
          fit: BoxFit.cover,
        ),
        // Image(
        //   image: NetworkImage('https://i.redd.it/x50cm40wq4z41.jpg'),
        // ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('Alberta, Canada')
        )
      ],
    ),
  );

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black38,
          blurRadius: 10.0,
          spreadRadius: 2.0,
          offset: Offset(2.0,10.0)
        )
      ]
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card2,
    ),
  );

}