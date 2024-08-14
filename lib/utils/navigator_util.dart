import 'package:crud_note/modals/note.dart';
import 'package:crud_note/screens/favorite_screen.dart';
import 'package:crud_note/screens/note_detail_screen.dart';
import 'package:crud_note/screens/notes_screen.dart';
import 'package:crud_note/screens/settings_screen.dart';
import 'package:crud_note/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class NavigatorUtil {
  static void navigateTo(Screen screen, BuildContext context,
      [bool replace = false]) {
    switch (screen) {
      case Screen.splashScreen:
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const SplashScreen()));
      case Screen.noteScreen:
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const NotesScreen()));
      case Screen.settingScreen:
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => const SettingsScreen()));
      case Screen.favoriteScreen:
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => const FavoriteScreen()));
    }
  }

  static void navigateToNoteDetail(BuildContext context, Note note) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => NoteDetailScreen(
          note: note,
        ),
      ),
    );
  }
}

enum Screen { splashScreen, noteScreen, settingScreen, favoriteScreen }
