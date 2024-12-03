import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_application_1/screens/Notas.dart';
import 'package:flutter_application_1/screens/bienvenida.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      initialRoute: '/bienvenida', 
      routes: {
        '/bienvenida': (context) => const Bienvenida(),
        '/principal': (context) =>NotesScreen(notes: miListaDeNotas),
      },
      home: NotesScreen(notes: miListaDeNotas),
      debugShowCheckedModeBanner: false,
    );
  }
}