import 'package:crud_note/modals/note.dart';
import 'package:crud_note/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/note_list.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteList = ref.watch<List<Note>>(favoriteProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text(
          "Favorites",
          style: GoogleFonts.robotoCondensed(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: NoteList(
              noteList: favoriteList,
            ),
          ),
        ],
      ),
    );
  }
}
