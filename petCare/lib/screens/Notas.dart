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
        title: const Text('Notas'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => openNoteAddScreen()),
        ],
      ),
      body: widget.notes.isEmpty
          ? const Center(child: Text("No hay notas\nToca + para añadir una."))
          : ListView.builder(
              itemCount: widget.notes.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(widget.notes[index].nombre),
                  onTap: () => openNoteEditScreen(widget.notes[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () =>
                        setState(() => widget.notes.removeAt(index)),
                  ),
                ),
              ),
            ),
    );
  }

  openNoteAddScreen() async {
 final Notas miNuevaNota = await Navigator.push(
      context, 
      MaterialPageRoute(
        builder:(ctx) =>  NoteAddScreen(),
    )
    );
    setState(() {
      miListaDeNotas.add(miNuevaNota);
    });
  }

  openNoteEditScreen(Notas note) async {
 final Notas miNotaModificada = await Navigator.push(
      context, 
      MaterialPageRoute(
        builder:(ctx) => NoteEditScreen(notaParaModificar:note),
    )
    );
final posicionNota = widget.notes.indexOf(note);
if(posicionNota != -1){
 setState(() {
  widget.notes[posicionNota] = miNotaModificada;
   //   miListaDeNotas.add(miNotaModificada);
    });
}
   
   
  }
}
