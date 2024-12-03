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
  TextEditingController edadController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imagePathController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nombreController.text = widget.notaParaModificar.nombre;
    descriptionController.text = widget.notaParaModificar.descripcion;
    imagePathController.text = widget.notaParaModificar.imagePath ?? ''; // Si es null, que esté vacío
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      appBar: AppBar(
        title:getLogo(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: edadController,
              decoration: const InputDecoration(labelText: 'Edad'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: imagePathController,
              decoration: const InputDecoration(labelText: 'Ruta de la imagen (opcional)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                modificarNota(context);
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }

    Widget getLogo() {
    return Center(
      child: Image.asset(
        'assets/images/logoPCApp.png',
      ),
    );
  }

  void modificarNota(BuildContext context) {
    String notaModificada = nombreController.text;
    String nuevaEdad = edadController.text;
    String descripcionModificada = descriptionController.text;
    String? nuevaImagen = imagePathController.text.isNotEmpty ? imagePathController.text : null;

    Notas miNotaModificada = Notas(
      nombre: notaModificada,
      edad:nuevaEdad,
      descripcion: descripcionModificada,
      imagePath: nuevaImagen,
    );
    
    Navigator.of(context).pop(miNotaModificada);
  }
}
