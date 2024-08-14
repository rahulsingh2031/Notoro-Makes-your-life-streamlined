import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Note {
  final String noteId;
  final String task;
  final DateTime createdAt;
  final Significance significance;
  bool isFavorite = false;
  String description = "";

  Note(
      {required this.task,
      required this.createdAt,
      required this.significance,
      this.isFavorite = false,
      this.description = ""})
      : noteId = uuid.v4();
  Note.now({required this.task, required this.significance})
      : createdAt = DateTime.now(),
        noteId = uuid.v4();
}

Map<Significance, IconData> significanceIcon = {
  Significance.importance: Icons.star,
  Significance.moderate: Icons.add_moderator_rounded,
  Significance.inessential: Icons.no_accounts
};

enum Significance { importance, moderate, inessential }
