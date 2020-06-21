import 'package:currency_converter/componets/Inputs.dart';
import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  Converter({this.dolar, this.euro});

  final double dolar;
  final double euro;
  @override
  _ConverterState createState() => _ConverterState(this.dolar, this.euro);
}

class _ConverterState extends State<Converter> {
  _ConverterState(this.dolar, this.euro);

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  double dolar;
  double euro;

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = ((dolar * this.dolar) / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = ((euro * this.euro) / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.monetization_on,
            size: 150.0,
            color: Colors.amber,
          ),
          Inputs('Reais', 'R\$', realController, _realChanged),
          // buildTextField('Reais', 'R\$', realController, _realChanged),
          Divider(),
          Inputs('Dolar', 'US\$', dolarController, _dolarChanged),
          // buildTextField('Dolar', 'US\$', dolarController, _dolarChanged),
          Divider(),
          Inputs('Euro', '€', euroController, _euroChanged),
          // buildTextField('Euro', '€', euroController, _euroChanged),
        ],
      ),
    );
  }
}

buildTextField(String name, String prefix, TextEditingController controller,
    Function changed) {
  return TextField(
    controller: controller,
    onChanged: changed,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: name,
      labelStyle: TextStyle(
        color: Colors.amber,
      ),
      border: OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: TextStyle(
      color: Colors.amber,
      fontSize: 25.0,
    ),
  );
}
