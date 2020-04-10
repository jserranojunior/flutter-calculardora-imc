import 'package:flutter/material.dart';
class Layout { 
  static Scaffold render(Widget content, Widget formulario, String title){
  return Scaffold(
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    appBar: AppBar(    
    title: Text(title),    
  ),    
  body:  
  formulario,
  
  );
}
}
