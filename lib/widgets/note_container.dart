import 'package:crud_note/modals/note.dart';
import 'package:crud_note/providers/notes_provider.dart';
import 'package:crud_note/utils/date_utils.dart';
import 'package:crud_note/utils/navigator_util.dart';
import 'package:crud_note/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteContainer extends ConsumerWidget {
  const NoteContainer(
      {super.key, required this.note, this.noteIcon = Icons.circle_rounded});
  final Note note;
  final IconData noteIcon;

  // void _showDialog(BuildContext ctx) {
  //   showDialog(
  //       context: ctx,
  //       builder: (context) => AlertDialog(
  //             title: const Text(
  //               "Edit Note",
  //               textAlign: TextAlign.center,
  //             ),
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(8)),
  //             titleTextStyle: GoogleFonts.robotoMono().copyWith(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 20,
  //               color: Theme.of(context).colorScheme.primary,
  //             ),
  //             content: const Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 TextField(
  //                   decoration: InputDecoration(labelText: "Task"),
  //                 )
  //               ],
  //             ),
  //           ));
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ObjectKey(note),
      onDismissed: (direction) =>
          ref.read(notesProvider.notifier).removeNote(note),
      child: GestureDetector(
        onTap: () => NavigatorUtil.navigateToNoteDetail(context, note),
        child: Card(
          child: ListTile(
            title: Text(
              note.task,
              style: GoogleFonts.robotoFlex(),
            ),
            subtitle: Text(
              DateUtil.formatDate(note.createdAt),
              style: GoogleFonts.robotoCondensed(),
            ),
            leading: Icon(noteIcon),
            trailing: FavoriteButton(
              isFavorite: note.isFavorite,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              onTap: (state) {
                ref.read(notesProvider.notifier).updateNote(
                    note, note.description, state, note.significance);
              },
            ),
          ),
        ),
      ),
    );
  }
}
