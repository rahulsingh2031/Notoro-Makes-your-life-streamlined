import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.surface,
          ),
          title: Text(
            "Add a Task",
            style: GoogleFonts.robotoCondensed().copyWith(
                color: Theme.of(context).colorScheme.surface,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
