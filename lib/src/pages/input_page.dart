import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Billionaire';

  List<String> _poderes = ['Billionaire','Smart','Philantrophy','Rude'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context ),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
          Divider(),
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text('Caracteres: ${ _nombre.length }'),
        hintText: 'Nombre...',
        labelText: 'Nombre',
        helperText: 'Sólo nombre, sin apellidos',
        suffixIcon: Icon( Icons.person_outline, color: Colors.blue),
        icon: Icon( Icons.account_circle, color: Colors.blue )
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );

  }

  

  Widget _crearEmail(){
    
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text('Caracteres: ${ _email.length }'),
        hintText: 'Email...',
        labelText: 'Email',
        suffixIcon: Icon( Icons.alternate_email, color: Colors.blue),
        icon: Icon( Icons.email, color: Colors.blue )
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
      },
    );

  }


  Widget _crearPassword(){
    return TextField(
      obscureText: true, //ocultamos los caracteres tipo password
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text('Caracteres: ${ _email.length }'),
        hintText: 'Password...',
        labelText: 'Password',
        suffixIcon: Icon( Icons.lock, color: Colors.blue),
        icon: Icon( Icons.lock_outline_rounded, color: Colors.blue )
      ),
      // onChanged: (valor){
      //   setState(() {
      //     _email = valor;
      //   });
      // },
    );
  }

  Widget _crearFecha( BuildContext context ) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        //counter: Text('Caracteres: ${ _email.length }'),
        hintText: 'Fecha nacimiento',
        labelText: 'Fecha nacimiento',
        suffixIcon: Icon( Icons.perm_contact_calendar, color: Colors.blue),
        icon: Icon( Icons.calendar_today, color: Colors.blue )
      ),
      onTap: () {

        FocusScope.of(context).requestFocus(new FocusNode()); //quitamos el focus
        _selectDate( context );

      }
    );
  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2000),
      lastDate: new DateTime(2050),
      locale: Locale('es')
    );

    if ( picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }

  }

  //Lista de DropDown Menu
  List<DropdownMenuItem<String>> getOpcionesDropdown () {

      List<DropdownMenuItem<String>> lista = new List();

      _poderes.forEach( (poder){
        lista.add( DropdownMenuItem(
          child: Text(poder),
          value: poder,
        ));

      });

      return lista;

  }


  Widget _crearDropDown() {
    
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        )    
      ],     
    );
  }



  Widget _crearPersona() {

    return ListTile(
      title: Text('Bienvenido $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
    
  }

  }