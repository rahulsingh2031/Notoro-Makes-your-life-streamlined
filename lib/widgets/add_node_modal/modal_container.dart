import 'package:crud_note/modals/note.dart';
import 'package:crud_note/providers/notes_provider.dart';
import 'package:crud_note/widgets/add_node_modal/custom_text_field.dart';
import 'package:crud_note/widgets/add_node_modal/row_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModalContainer extends ConsumerStatefulWidget {
  const ModalContainer({
    super.key,
  });

  @override
  ConsumerState<ModalContainer> createState() => _ModalContainerState();
}

class _ModalContainerState extends ConsumerState<ModalContainer> {
  var _significance = Significance.moderate;
  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: keyboardSpace),
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CustomTextField(
                onSubmit: (value) async {
                  final newNote = Note.now(
                    task: value,
                    significance: _significance,
                  );
                  await ref.read(notesProvider.notifier).addNote(newNote);
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            RowButton(
              onSelect: (significance) {
                _significance = significance;
              },
            )
          ],
        ),
      ),
    );
  }
}
