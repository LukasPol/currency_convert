import 'package:flutter/material.dart';

class Inputs extends StatefulWidget {
  final String name;
  final String prefix;
  final TextEditingController controller;
  final Function changed;

  Inputs(this.name, this.prefix, this.controller, this.changed);
  @override
  _InputsState createState() =>
      _InputsState(this.name, this.prefix, this.controller, this.changed);
}

class _InputsState extends State<Inputs> {
  final String name;
  final String prefix;
  final TextEditingController controller;
  final Function changed;

  _InputsState(this.name, this.prefix, this.controller, this.changed);
  @override
  Widget build(BuildContext context) {
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
}
