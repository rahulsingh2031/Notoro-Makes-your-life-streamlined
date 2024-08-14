import 'package:crud_note/modals/note.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotesProviderNotifier extends StateNotifier<List<Note>> {
  NotesProviderNotifier() : super([]);

  void addNote(Note newNote) {
    state = [...state, newNote];
  }

  void removeAllNote() {
    state = [];
  }

  void toggleFavorite(Note note, bool value) {
    int index = state.indexOf(note);
    Note newNote = Note(
        task: note.task,
        createdAt: note.createdAt,
        significance: note.significance,
        isFavorite: value);
    var reducedState =
        state.where((element) => element.noteId != note.noteId).toList();
    reducedState.insert(index, newNote);
    state = reducedState;
  }

  void removeAllFavorite() {
    final newState = List.of(state);
    for (var note in newState) {
      note.isFavorite = false;
    }
    state = newState;
  }

  void addDescription(Note note, String description) {
    int index = state.indexOf(note);
    Note newNote = Note(
        task: note.task,
        createdAt: note.createdAt,
        significance: note.significance,
        isFavorite: note.isFavorite,
        description: description);
    var reducedState =
        state.where((element) => element.noteId != note.noteId).toList();
    reducedState.insert(index, newNote);
    state = reducedState;
  }

  void removeNote(Note note) {
    state = state.where((element) => element.noteId != note.noteId).toList();
  }
}

final notesProvider =
    StateNotifierProvider<NotesProviderNotifier, List<Note>>((ref) {
  return NotesProviderNotifier();
});
