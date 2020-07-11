import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Contador',
            style: Theme.of(context).textTheme.display2,
          ),
          Text(
            "$contador",
            style: Theme.of(context).textTheme.display3,
          ),
          FlatButton(
              child: const Text('ADICIONAR'),
              color: Colors.blue,
              splashColor: Colors.black12,
              onPressed: () {
                setState(() {
                  contador++;
                });
              }),
          FlatButton(
              child: const Text('REMOVER'),
              color: Colors.deepOrange,
              splashColor: Colors.black12,
              onPressed: () {
                setState(() {
                  contador--;
                });
              })
        ],
      ),
    ));
  }
}
