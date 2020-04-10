import 'package:flutter/material.dart';
import 'package:teste_app/layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = "Estudos Flutter";
    return MaterialApp(
      title: title,
      theme: ThemeData(      
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int contador = 0;
  String imc = "0";
  String textoImc = "";
  final TextEditingController _controladorPeso = TextEditingController();
  final TextEditingController _controladorAltura = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
 
    Widget content = Center(           
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
        
          FlatButton(child: const Text('ADICIONAR'),
            color:Colors.blue,
            splashColor: Colors.black12,
            onPressed:(){
              setState(() {
                contador++;
              });
            }
          ),
          FlatButton(child: const Text('REMOVER'),
            color:Colors.deepOrange,
            splashColor: Colors.black12,
            onPressed:(){
              setState(() {
                contador--;
              });
            }
          )                   
        ],          
      ), 
    ); 
   
    Widget formulario = Center(           
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
          FlatButton(child: const Text('Calcular'),
            color:Colors.blue,
            splashColor: Colors.black12,
            onPressed:(){
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
            }
          ),                          
        ],          
      ), 
    ); 
   

  return Layout.render(content, formulario, widget.title);
  }
}
