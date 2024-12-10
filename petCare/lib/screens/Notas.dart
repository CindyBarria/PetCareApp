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
      body: getPet(),
    );
  }

  Widget getPet() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Mascotas",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: Color(0xFF3C9093),
                fontFamily: 'Montserrat',
              ),
            ),
            addButton(() {
              openNoteAddScreen();
            }),
          ],
        ),
        Expanded(
          child: widget.notes.isEmpty
              ? const Center(
                  child: Text("No hay mascotas\nToca + para añadir una."),
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
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(8),
                            child: widget.notes[index].imagePath != null &&
                                    widget.notes[index].imagePath!.isNotEmpty
                                ? Image.asset(
                                    widget.notes[index].imagePath!,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(
                                    Icons.pets,
                                    size: 80,
                                    color: Colors.grey,
                                  ),
                          ),
                          const SizedBox(width: 16),
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
                          // Botones Editar y Eliminar
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit,
                                    color: Color(0xFFFFAE34)),
                                onPressed: () =>
                                    openNoteEditScreen(widget.notes[index]),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Color(0xFFFFAE34)),
                                onPressed: () => setState(
                                    () => widget.notes.removeAt(index)),
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
      MaterialPageRoute(builder: (ctx) => const NoteAddScreen()),
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

  Widget addButton(VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: const Row(
        children: [
          Text(
            "Agregar",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Color(0xFF3C9093),
              fontFamily: 'Montserrat',
            ),
          ),
          Icon(
            Icons.add,
            color: Color(0xFF3C9093),
          ),
        ],
      ),
    );
  }
}
