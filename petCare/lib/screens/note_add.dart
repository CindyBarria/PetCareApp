import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/notas.dart';

class NoteAddScreen extends StatelessWidget {
  NoteAddScreen({super.key});

  TextEditingController nombreController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imagePathController = TextEditingController(); // Agregamos un campo para la ruta de la imagen

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
                agregarNuevaNota(context);
              },
              child: const Text('Guardar Nota'),
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
  
  void agregarNuevaNota(BuildContext context) {
    String nuevaNota = nombreController.text;
    String nuevaDescripcion = descriptionController.text;
    String? nuevaImagen = imagePathController.text.isNotEmpty ? imagePathController.text : null; // Si no hay ruta de imagen, se establece como null

    Notas miNuevaNota = Notas(
      nombre: nuevaNota,
      descripcion: nuevaDescripcion,
      imagePath: nuevaImagen,
    );
    
    Navigator.of(context).pop(miNuevaNota);
  }
}
