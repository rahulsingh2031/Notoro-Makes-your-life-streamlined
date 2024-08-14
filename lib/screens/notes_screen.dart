import 'package:crud_note/modals/note.dart';
import 'package:crud_note/providers/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/add_node_modal/add_note_button.dart';
import '../widgets/add_node_modal/modal_container.dart';
import '../widgets/note_list.dart';

class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});

  void addNewNote(Note note, WidgetRef ref) {
    ref.read(notesProvider.notifier).addNote(note);
  }

  void _showAddNoteModalSheet(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Theme.of(ctx).colorScheme.primaryContainer,
        shape: const RoundedRectangleBorder(),
        context: ctx,
        isDismissible: true,
        builder: (context) {
          return const ModalContainer();
        });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteList = ref.watch<List<Note>>(notesProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text(
          "Tasks",
          style: GoogleFonts.robotoCondensed(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: NoteList(
              noteList: noteList,
            ),
          ),
          AddNoteButton(onTap: () => _showAddNoteModalSheet(context)),
        ],
      ),
    );
  }
}
