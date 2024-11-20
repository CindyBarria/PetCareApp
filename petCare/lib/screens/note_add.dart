import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/notas.dart';

class NoteAddScreen extends StatelessWidget {
NoteAddScreen({super.key});

TextEditingController nombreController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(     
      appBar: AppBar(
        title: const Text('Añadir Notas'),
      ),
      body: TextField(
        controller:nombreController
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {agregarNuevaNota(context);},
        child:const Icon(
          Icons.save,
          color:Colors.blue,
        ),
        ),
    );
  }
  
  agregarNuevaNota(BuildContext context) {
    String nuevaNota = nombreController.text;
    Notas miNuevaNota = Notas(nombre:nuevaNota);
    Navigator.of(context).pop(miNuevaNota);
  }
}