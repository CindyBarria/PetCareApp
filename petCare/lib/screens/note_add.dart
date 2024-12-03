import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/model/notas.dart';

class NoteAddScreen extends StatefulWidget {
  const NoteAddScreen({super.key});

  @override
  _NoteAddScreenState createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController edadController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getLogo(),
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
            const SizedBox(height: 20),
            _selectedImage != null
                ? Image.file(
                    _selectedImage!,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  )
                : const Text('No se ha seleccionado ninguna imagen'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Seleccionar Imagen'),
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

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void agregarNuevaNota(BuildContext context) {
    String nuevaNota = nombreController.text;
    String nuevaEdad = edadController.text;
    String nuevaDescripcion = descriptionController.text;
    String? nuevaImagen = _selectedImage?.path;

    Notas miNuevaNota = Notas(
      nombre: nuevaNota,
      edad: nuevaEdad,
      descripcion: nuevaDescripcion,
      imagePath: nuevaImagen,
    );
    Navigator.of(context).pop(miNuevaNota);
  }
}
