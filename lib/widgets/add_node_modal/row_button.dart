import 'package:crud_note/modals/note.dart';
import 'package:crud_note/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Pass the selected significance to the noteScreen
class RowButton extends StatefulWidget {
  const RowButton({
    super.key,
    required this.onSelect,
  });
  final void Function(Significance) onSelect;
  @override
  State<RowButton> createState() => _RowButtonState();
}

class _RowButtonState extends State<RowButton> {
  var _selectedSignificance = Significance.moderate;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (final significance in Significance.values)
          TextButton.icon(
            onPressed: () {
              setState(() {
                _selectedSignificance = significance;
              });
              widget.onSelect(_selectedSignificance);
            },
            label: Text(
              significance.name.capitalize(),
              style: GoogleFonts.roboto().copyWith(
                  fontSize: _selectedSignificance == significance ? 15 : 13,
                  color: _selectedSignificance == significance
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.tertiary),
            ),
            icon: Icon(
              significanceIcon[significance],
              size: 16,
            ),
          )
      ],
    );
  }
}
