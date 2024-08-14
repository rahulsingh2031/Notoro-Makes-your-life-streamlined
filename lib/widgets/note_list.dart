import 'package:crud_note/modals/note.dart';
import 'package:crud_note/widgets/note_container.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key, required this.noteList});

  final List<Note> noteList;

  ListView getNoteListView(List<Note> noteList) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: noteList.length,
      itemBuilder: (BuildContext context, int index) {
        return NoteContainer(
          note: noteList[index],
          noteIcon: significanceIcon[noteList[index].significance]!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = getNoteListView(noteList);

    return content;
  }
}
