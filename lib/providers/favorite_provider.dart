import 'package:crud_note/modals/note.dart';
import 'package:crud_note/providers/notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteProvider = Provider<List<Note>>((ref) {
  final noteList = ref.watch(notesProvider);

  return noteList.where((note) => note.isFavorite == true).toList();
});
