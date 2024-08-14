import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText = "Add a Task",
    required this.onSubmit,
  });

  final void Function(String value) onSubmit;
  final String hintText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _focusNode = FocusNode();
  bool iskeyboardShown = false;
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        iskeyboardShown = true;
        return;
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //To Close modal sheet too once user tap back button
    if (iskeyboardShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final btx = MediaQuery.of(context).viewInsets.bottom;
        if (btx == 0) {
          Navigator.pop(context);
        }
      });
    }
    return TextField(
      controller: _textController,
      focusNode: _focusNode,
      onSubmitted: (value) {
        if (_textController.text.trim().isEmpty) {
          Navigator.pop(context);
          return;
        }
        widget.onSubmit(value);

        _focusNode.requestFocus();

        _textController.clear();
      },
      autofocus: true,
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Icon(Icons.circle_outlined),
          ),
          hintText: widget.hintText),
    );
  }
}
