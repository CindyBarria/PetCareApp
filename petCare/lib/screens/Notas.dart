import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/note_adit.dart';
import '../data/data.dart';
import 'package:flutter_application_1/model/notas.dart';
import 'package:flutter_application_1/screens/note_add.dart';

class NotesScreen extends StatefulWidget {
  final List<Notas> notes;

  const NotesScreen({super.key, required this.notes});

  @override 
  NotesScreenState createState() => NotesScreenState();
}

class NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getLogo(),
      ),
      backgroundColor: const Color(0xFFFFF7EB),
      body: getPet(), // Llamamos a la función getPet para organizar el body
    );
  }
 
  /// Función para mostrar el contenido del cuerpo
  Widget getPet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alineación del título
      children: [
        
        const Padding(
          padding: EdgeInsets.all(16.0 ),
          child: Text(
            "Mascotas",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Color(0xFF3C9093),
              fontFamily: 'Montserrat',
            ),
          ),
          
        ),
        Expanded( // Para que el ListView ocupe el espacio restante
          child: widget.notes.isEmpty
              ? const Center(
                  child: Text("No hay notas\nToca + para añadir una."),
                )
              : ListView.builder(
            itemCount: widget.notes.length,
            itemBuilder: (context, index) => Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagen de la mascota
                     ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Bordes redondeados
                      child: widget.notes[index].imagePath != null && widget.notes[index].imagePath!.isNotEmpty
                          ? Image.asset(
                              widget.notes[index].imagePath!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            )
                          :const Icon(
                              Icons.pets,
                              size: 80,
                              color: Colors.grey,
                            ),
                    ),
                    const SizedBox(width: 16), // Espaciado entre la imagen y el texto
                    // Información de la mascota
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.notes[index].nombre,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.notes[index].edad!,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                     
                          Text(
                            widget.notes[index].descripcion,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Botones de acción (Editar y Eliminar)
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.orange),
                          onPressed: () =>
                              openNoteEditScreen(widget.notes[index]),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () =>
                              setState(() => widget.notes.removeAt(index)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> openNoteAddScreen() async {
    final Notas miNuevaNota = await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => NoteAddScreen()),
    );
    setState(() {
      widget.notes.add(miNuevaNota);
    });
  }

  Future<void> openNoteEditScreen(Notas note) async {
    final Notas notaModificada = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => NoteEditScreen(notaParaModificar: note),
      ),
    );
    setState(() {
      int index = widget.notes.indexOf(note);
      widget.notes[index] = notaModificada;
    });
  }

  Widget getLogo() {
    return Center(
      child: Image.asset(
        'assets/images/logoPCApp.png',
     
      ),
    );
  }
}
