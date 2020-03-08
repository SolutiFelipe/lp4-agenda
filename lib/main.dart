import 'package:flutter/material.dart';

int _cliques = 0;
void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Título Primeiro App"),
      ),
      body: Center(
        child: Text(
          "Testando Body!",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      backgroundColor: Colors.white70,
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          debugPrint('clicou no botão');
          _cliques++;
          debugPrint(_cliques.toString());
        },
        child: const Icon(Icons.add),
      ),
    ),
  ),
);
