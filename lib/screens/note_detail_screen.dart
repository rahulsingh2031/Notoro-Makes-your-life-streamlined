import 'package:crud_note/modals/note.dart';
import 'package:crud_note/providers/notes_provider.dart';
import 'package:crud_note/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/favorite_button.dart';

class NoteDetailScreen extends ConsumerStatefulWidget {
  const NoteDetailScreen({super.key, required this.note});
  final Note note;

  @override
  ConsumerState<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends ConsumerState<NoteDetailScreen> {
  late TextEditingController taskTextController;

  @override
  void initState() {
    super.initState();
    taskTextController = TextEditingController(text: widget.note.task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          "Details",
          style: GoogleFonts.robotoCondensed(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: taskTextController,
              style: GoogleFonts.robotoFlex().copyWith(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 19),
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              onSubmitted: (value) {},
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.circle_outlined,
                    color: Theme.of(context).colorScheme.onPrimary),
                suffixIcon: FavoriteButton(
                  isFavorite: widget.note.isFavorite,
                  color: Theme.of(context).colorScheme.onPrimary,
                  onTap: (state) {
                    ref
                        .read(notesProvider.notifier)
                        .toggleFavorite(widget.note, state);
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  width: 1,
                  color: Theme.of(context).colorScheme.secondaryFixed),
            ),
            child: TextField(
              style: GoogleFonts.roboto().copyWith(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              minLines: 1,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Add Description(Optional)",
                hintStyle: GoogleFonts.roboto().copyWith(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<Significance>(
                  value: widget.note.significance,
                  dropdownColor:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  underline: const SizedBox(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  items: Significance.values
                      .map((element) => DropdownMenuItem<Significance>(
                          value: element,
                          child: Row(
                            children: [
                              Icon(
                                significanceIcon[element],
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              Text(
                                element.name,
                                style: GoogleFonts.roboto().copyWith(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    fontSize: 15),
                              )
                            ],
                          )))
                      .toList(),
                  onChanged: (significance) {}),
              Text("Created on ${DateUtil.formatDate(widget.note.createdAt)}",
                  style: GoogleFonts.roboto().copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ))
            ],
          )
        ],
      ),
    );
  }
}