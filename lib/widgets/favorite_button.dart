import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onTap,
    required this.color,
  });

  final bool isFavorite;
  final void Function(bool state) onTap;
  final Color color;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool isActive;
  @override
  void initState() {
    super.initState();
    isActive = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isActive = !isActive;
        });

        widget.onTap(isActive);
      },
      icon: Icon(isActive ? Icons.star : Icons.star_border_outlined,
          color: widget.color),
    );
  }
}
