import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonListTile extends StatelessWidget {
  const ButtonListTile(
      {super.key,
      required this.title,
      required this.onTap,
      required this.buttonTitle});
  final String title;
  final String buttonTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.roboto()
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
      trailing: TextButton.icon(
          onPressed: onTap,
          label: Text(
            "Clear",
            style: GoogleFonts.roboto().copyWith(
                color: Theme.of(context).colorScheme.primaryContainer),
          )),
    );
  }
}
