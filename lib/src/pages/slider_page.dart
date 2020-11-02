import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 500.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      //activeColor: Colors.red[300],
      label: 'Tamaño de la imagen',
      value: _valorSlider,
      min: 10.0,
      max: 600.0,
      onChanged: ( _bloquearCheck ) ? null : ( valor ){

        setState((){
          _valorSlider = valor;
        });
      
      },
    );

  }

  Widget _checkBox() {

      return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor){
          setState(() {
            _bloquearCheck = valor;
          });
          
        },
      );

  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor){
          setState(() {
            _bloquearCheck = valor;
          });
          
        },
      );
  }

  Widget _crearImagen() {

      return Image(
        image: NetworkImage('https://vignette.wikia.nocookie.net/death-battle-en-espanol/images/f/f2/Iron-man-mark-iii_marvel_silo.png/revision/latest/scale-to-width-down/340?cb=20200207053539&path-prefix=es'),
        width: _valorSlider,
        fit: BoxFit.contain,
      );

  }

}