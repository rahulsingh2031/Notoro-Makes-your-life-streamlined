import 'package:crud_note/modals/note.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NotesProviderNotifier extends StateNotifier<List<Note>> {
  NotesProviderNotifier() : super([]);
  late final Isar _isar;
  Future<void> loadNotes() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([NoteSchema], directory: dir.path);
    state = await _isar.notes.where().findAll();
  }

  Future<void> addNote(Note newNote) async {
    await _isar.writeTxn(() async {
      await _isar.notes.put(newNote);
    });
    state = [...state, newNote];
  }

  Future<void> removeAllNote() async {
    await _isar.writeTxn(() async {
      await _isar.notes.where().deleteAll();
    });
    state = [];
  }

  void removeAllFavorite() {
    final newState = List.of(state);
    for (var note in newState) {
      note.isFavorite = false;
    }
    state = newState;
  }

  Future<void> updateNote(Note note, String description, bool isFavorite,
      Significance significance) async {
    int index = state.indexOf(note);
    Note newNote = Note(
        task: note.task,
        createdAt: note.createdAt,
        significance: significance,
        isFavorite: isFavorite,
        description: description);
    newNote.noteId = note.noteId;
    // var reducedState =
    //     state.where((element) => element.noteId != note.noteId).toList();
    final newState = [...state];
    newState[index] = newNote;
    await _isar.writeTxn(() async {
      final noteDb = await _isar.notes.get(note.id);
      if (noteDb != null) {
        noteDb.description = description;
        noteDb.significance = significance;
        noteDb.isFavorite = isFavorite;
        await _isar.notes.put(noteDb);
      }
    });
    state = newState;
  }

  Future<void> removeNote(Note note) async {
    final newState = [...state];
    newState.remove(note);
    state = newState;

    await _isar.writeTxn(() async {
      await _isar.notes.delete(note.id);
    });
  }
}

final notesProvider =
    StateNotifierProvider<NotesProviderNotifier, List<Note>>((ref) {
  return NotesProviderNotifier();
});
