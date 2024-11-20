import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/notas.dart';

class NoteEditScreen extends StatefulWidget {
  Notas notaParaModificar;
NoteEditScreen({super.key, required this.notaParaModificar});

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
TextEditingController nombreController = TextEditingController();

@override
  void initState() {
  nombreController.text = widget.notaParaModificar.nombre;
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(     
      appBar: AppBar(
        title: const Text('Editar Notas'),
      ),
      body: 
      Padding(padding: const EdgeInsets.only(top: 12, left: 12 , right: 12),
      child: TextField(
        controller:nombreController
      ),
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {modificarNota(context);},
        child:const Icon(
          Icons.save,
          color:Colors.blue,
        ),
        ),
    );
  }

  modificarNota(BuildContext context) {
    String notaModificada = nombreController.text;
    Notas miNotaModificada = Notas(nombre:notaModificada);
    Navigator.of(context).pop(miNotaModificada);
  }
}