import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

part 'note.g.dart';

const uuid = Uuid();

@collection
class Note with EquatableMixin {
  Id id = Isar.autoIncrement;
  String noteId;
  final String task;
  final DateTime createdAt;

  @enumerated
  Significance significance;
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

  @override
  List<Object?> get props => [noteId];
}

Map<Significance, IconData> significanceIcon = {
  Significance.importance: Icons.star,
  Significance.moderate: Icons.add_moderator_rounded,
  Significance.inessential: Icons.no_accounts
};

enum Significance { importance, moderate, inessential }
