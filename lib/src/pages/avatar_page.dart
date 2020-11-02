import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://tshirt-factory.com/images/detailed/37/Kratos-T-shirt-design-37192.jpg'),
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('RO'),
              backgroundColor: Colors.deepOrange[300],
            ),
          )
        ]
      ),

      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://vistapointe.net/images/god-of-war-iii-wallpaper-2.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration( milliseconds: 400),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.arrow_back_ios ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}