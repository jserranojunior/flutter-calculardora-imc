import 'package:flutter/material.dart';

class Imc extends StatefulWidget {
  @override
  _ImcState createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  String imc = "0";
  String textoImc = "";
  final TextEditingController _controladorPeso = TextEditingController();
  final TextEditingController _controladorAltura = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Calculadora de imc',
            style: Theme.of(context).textTheme.display1,
          ),
          TextField(controller: _controladorPeso),
          TextField(controller: _controladorAltura),
          Text(
            "IMC: $imc",
            style: Theme.of(context).textTheme.display2,
          ),
          Text(
            "$textoImc",
            style: Theme.of(context).textTheme.display1,
          ),
          FlatButton(
              child: const Text('Calcular'),
              color: Colors.blue,
              splashColor: Colors.black12,
              onPressed: () {
                double peso = double.parse(_controladorPeso.text);
                double altura = double.parse(_controladorAltura.text) / 100.0;
                double resultado = peso / (altura * altura);

                // print(imc.toStringAsPrecision(2));

                setState(() {
                  imc = resultado.toStringAsPrecision(2);

                  if (resultado < 18.6)
                    textoImc = "Abaixo do peso";
                  else if (resultado < 25.0)
                    textoImc = "Peso ideal";
                  else if (resultado < 30.0)
                    textoImc = "Levemente acima do peso";
                  else if (resultado < 35.0)
                    textoImc = "Obesidade Grau I";
                  else if (resultado < 40.0)
                    textoImc = "Obesidade Grau II";
                  else
                    textoImc = "Obesidade Grau IIII";
                });
              }),
        ],
      ),
    ));
  }
}
