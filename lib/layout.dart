import 'package:flutter/material.dart';

class Layout {
  static Scaffold render(Widget contador, Widget imc, String title) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text(title),
      ),
      body: imc,
    );
  }
}
